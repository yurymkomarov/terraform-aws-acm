# AWS Certificate Manager

This module provides AWS Certificate Manager resources:
- ACM certificate
- Route53 records for ACM Certificate validation

# Input variables
- `name` - Name that will be used in resources names and tags
- `domain_name` - The name of the hosted zone

# Output variables
- `acm_certificate`
    - `id` - The ARN of the certificate
    - `arn` - The ARN of the certificate
    - `domain_name` - The domain name for which the certificate is issued
    - `domain_validation_options` - A list of attributes to feed into other resources to complete certificate validation
