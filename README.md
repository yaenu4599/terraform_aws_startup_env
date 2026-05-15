# terraform_aws_startup_env
An terraform aws evniroment simulating the resources used by a startup


aws s3api create-bucket \
 --bucket terraform-backend-bucked-v1 \
 --region eu-central-1 \
 --create-bucket-configuration LocationConstraint=eu-central-1

aws s3api put-bucket-tagging \
  --bucket terraform-backend-bucked-v1 \
  --tagging 'TagSet=[{Key=ManagedBy,Value=terraform},{Key=Environment,Value=dev},{Key=Project,Value=terraform_aws_startup_env}]'

aws s3api put-bucket-versioning \
--bucket terraform-backend-bucked-v1 \
--versioning-configuration Status=Enabled

aws s3api put-bucket-encryption \
--bucket terraform-backend-bucked-v1 \
--server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'


löschen

aws s3 rm s3://terraform-backend-bucked-v1 --recursive

aws s3api delete-bucket \
--bucket terraform-backend-bucked-v1 \
--region eu-central-1