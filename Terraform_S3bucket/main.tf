resource "aws_s3_bucket" "mys3bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "mys3bucket_ownership_controls" {
  bucket = aws_s3_bucket.mys3bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "mys3bucket_public_access_block" {
  bucket = aws_s3_bucket.mys3bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "mys3bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.mys3bucket_ownership_controls, aws_s3_bucket_public_access_block.mys3bucket_public_access_block]

  bucket = aws_s3_bucket.mys3bucket.id
  acl    = "public-read"
}

# resource "aws_s3_object" "index" {
#   bucket       = aws_s3_bucket.mys3bucket.id
#   key          = "index.html"
#   source       = "index.html"
#   acl          = "public-read"
#   content_type = "text/html"
# }


# resource "aws_s3_object" "buildFiles" {
#   bucket       = aws_s3_bucket.mys3bucket.id
#   for_each     = fileset("todo/build", "**/*.*")
#   key          = each.value
#   source       = "todo/build/${each.value}"
#   content_type = each.value
# }


# resource "aws_s3_bucket_website_configuration" "website" {
#   bucket = aws_s3_bucket.mys3bucket.id
#   index_document {
#     suffix = "index.html"
#   }
#   error_document {
#     key = "error.html"
#   }

#   depends_on = [aws_s3_bucket_acl.mys3bucket_acl]
# }

# resource "aws_s3_bucket_versioning" "mys3bucket_versioning" {
#   bucket = aws_s3_bucket.mys3bucket.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }




# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Sid": "PublicReadGetObject",
#             "Effect": "Allow",
#             "Principal": "*",
#             "Action": "s3:GetObject",
#             "Resource": "arn:aws:s3:::todoapp.com/*"
#         }
#     ]
# }