require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-migrations'

DataMapper.setup :default, "sqlite://#{Dir.pwd}/minichat.db"

class Channel
  include DataMapper::Resource

  property :slug      , String, key: true, unique_index: true
  property :username  , String
  property :content   , String
  property :created_at, DateTime
  property :updated_at, DateTime

  has n, :messages
end

class Message
  include DataMapper::Resource

  property :id        , Serial
  property :content   , String
  property :created_at, DateTime

  belongs_to :channel
end

DataMapper.auto_migrate!
