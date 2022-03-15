class SerializablePurchace < JSONAPI::Serializable::Resource
  type 'purchaces'

  attributes :state,
             :client_id,
             :offer_id,
             :commerce_id

  attribute :format_created_at do
    @object.created_at.in_time_zone("America/Bogota")
  end
end
