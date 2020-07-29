class SerializableOffer < JSONAPI::Serializable::Resource
  type 'offers'

  attributes :commerce_id,
              :title,
              :description,
              :image,
              :terms_and_conditions,
              :category_ids,
              :published,
              :discount_value

  attribute :commerce do
    Commerce.find(@object.commerce_id)
  end
  attribute :categories do
    @object.categories
  end
end
