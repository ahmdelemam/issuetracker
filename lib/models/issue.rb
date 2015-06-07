class Issue
  STATUSES = ['new', 'open', 'needs_info', 'duplicate', 'closed']
  include Mongoid::Document
  include Mongoid::Timestamps::Updated
  
  validates_presence_of :name, :description
  
  field :name, type: String
  field :description, type: String
  field :status, type: Symbol, default: :new
  
end