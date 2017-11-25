resource "aws_elasticsearch_domain" "es" {
  domain_name           = "${var.project_id}"
  elasticsearch_version = "5.5"
  cluster_config {
    instance_type   = "m3.medium.elasticsearch"
    instance_count  = "1"
  }

  #vpc_options {
  #  subnet_ids = ["${aws_subnet.public_subnet_a.id}"]
  #}

  advanced_options {
    "rest.action.multi.allow_explicit_index" = "true"
  }

#  access_policies = <<CONFIG
#{
#    "Version": "2012-10-17",
#    "Statement": [
#        {
#            "Action": "es:*",
#            "Principal": "*",
#            "Effect": "Allow",
#            "Condition": {
#                "IpAddress": {"aws:SourceIp": ["66.193.100.22/32"]}
#            }
#        }
#    ]
#}
#CONFIG

  snapshot_options {
    automated_snapshot_start_hour = 23
  }

  tags {
    Domain  = "${var.project} - Elasticsearch"
    Name    = "${var.project} - Elasticsearch"
    Project = "${var.project}"
    Owner   = "${var.owner}"
  }
}

