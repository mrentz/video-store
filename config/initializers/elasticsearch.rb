config = {
  host: "http://ec2-54-190-60-38.us-west-2.compute.amazonaws.com:9200/",
  transport_options: {
    request: { timeout: 5 }
  }
}

ENV["ELASTICSEARCH_URL"] = "http://ec2-54-190-60-38.us-west-2.compute.amazonaws.com:9200"
