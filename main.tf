resource "aws_acm_certificate" "this" {
  domain_name               = var.domain_name
  subject_alternative_names = [join(".", ["*", var.domain_name])]
  validation_method         = "DNS"

  tags = {
    Name      = var.name
    Module    = path.module
    Workspace = terraform.workspace
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "this" {
  name    = aws_acm_certificate.this.domain_validation_options[0]["resource_record_name"]
  type    = aws_acm_certificate.this.domain_validation_options[0]["resource_record_type"]
  zone_id = data.aws_route53_zone.this.zone_id
  records = [aws_acm_certificate.this.domain_validation_options[0]["resource_record_value"]]
  ttl     = 60

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "this" {
  certificate_arn         = aws_acm_certificate.this.arn
  validation_record_fqdns = [aws_route53_record.this.fqdn]

  lifecycle {
    create_before_destroy = true
  }
}
