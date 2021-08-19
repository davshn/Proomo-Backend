class SerializablePartner < JSONAPI::Serializable::Resource
  type 'partners'

  attributes :name,
             :documment,
             :documment_type

  attribute :commerces do
    @object.commerces
  end
  attribute :referrals do
    @object.referrals
  end
end
