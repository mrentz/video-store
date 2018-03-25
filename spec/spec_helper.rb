require 'capybara/rspec'
require 'elasticsearch/extensions/test/cluster'

Capybara.javascript_driver = :webkit

#Elasticsearch::Extensions::Test::Cluster.start(command: '/usr/share/elasticsearch/bin/elasticsearch',
#                                               address: 'http://ec2-54-190-60-38.us-west-2.compute.amazonaws.com',
#                                               force: true)

RSpec.configure do |config|

 # Start an in-memory cluster for Elasticsearch as needed
#  config.before :all, elasticsearch: true do
#    Elasticsearch::Extensions::Test::Cluster.new(command: '/usr/share/elasticsearch/bin/elasticsearch',
#                                                   port: 9250,
#                                                   nodes: 1,
#                                                   timeout: 120).start unless Elasticsearch::Extensions::Test::Cluster.running?(on: 9250#)
#    
#  end
  
   # Stop elasticsearch cluster after test run
#  config.after :suite do
#    Elasticsearch::Extensions::Test::Cluster.stop(command: '/usr/share/elasticsearch/bin/elasticsearch',
#                                                  port: 9250,
#                                                  nodes: 1) if Elasticsearch::Extensions::Test::Cluster.running?(on: 9250)
#  end

 
config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    config.shared_context_metadata_behavior = :apply_to_host_groups
  end

end

