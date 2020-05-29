class SerializableOffer < JSONAPI::Serializable::Resource
  type 'offers'

  attributes :commerce_id,
              :title,
              :description,
              :image,
              :terms_and_conditions,
              :category_ids,
              :published

  attribute :commerce do
    Commerce.find(@object.commerce_id)
  end
end
