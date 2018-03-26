module Searchable
  extend ActiveSupport::Concern

  included do
    
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    
    index_name "#{self.name.pluralize.downcase}-#{Rails.env}"
#    index_name [Rails.env, Video.collection].join('_')
    
  end
end
