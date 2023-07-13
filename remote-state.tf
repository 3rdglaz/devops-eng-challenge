resource "aws_s3_bucket" "remote-state" {
  bucket = "noticias-nuvem-remote-state"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.remote-state.id
  versioning_configuration {
    status = "Enabled"
  }
}

