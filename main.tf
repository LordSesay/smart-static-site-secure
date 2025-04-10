provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "secure_site" {
  bucket        = var.site_bucket
  force_destroy = true

  tags = {
    Name = "SecureStaticSite"
  }
}

resource "aws_s3_bucket_website_configuration" "secure_site" {
  bucket = aws_s3_bucket.secure_site.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.secure_site.id
  key          = "index.html"
  source       = "${path.module}/site/index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.secure_site.id
  key          = "error.html"
  source       = "${path.module}/site/error.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_public_access_block" "secure_site" {
  bucket = aws_s3_bucket.secure_site.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.secure_site.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowPublicRead",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.secure_site.arn}/*"
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.secure_site]
}

