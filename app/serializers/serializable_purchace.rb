class SerializablePurchace < JSONAPI::Serializable::Resource
  type 'purchaces'

  attributes :state,
             :client_id,
             :offer_id,
             :commerce_id

end
