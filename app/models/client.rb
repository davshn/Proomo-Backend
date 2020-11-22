class Client < User
  has_one :info_client
  has_many :favorites
  has_many :notifications
  has_many :purchaces
  has_many :reviews
end
