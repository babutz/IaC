#!/bin/sh

terraform init \
-backend-config="endpoint=storage.yandexcloud.net" \
-backend-config="bucket=babentsov" \
-backend-config="key=terraform.tfstate" \
-backend-config="access_key=$ACCESS_KEY" \
-backend-config="secret_key=$SECRET_KEY" \
-backend-config="region=us-west-1" \
-backend-config="skip_region_validation=true" \
-backend-config="skip_credentials_validation=true"

terraform plan