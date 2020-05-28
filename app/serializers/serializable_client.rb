class SerializableClient < JSONAPI::Serializable::Resource
  type 'users'

  attributes :email,
             :first_name,
             :second_name,
             :last_name,
             :last_second_name,
             :user_name,
             :phone,
             :birthday,
             :genre

  # has_many :pits
  #
  # attribute :pits do
  #   @object.pits
  # end
end
