class SerializableOffer < JSONAPI::Serializable::Resource
  type 'offers'

  attributes :commerce_id,
              :title,
              :description,
              :image,
              :terms_and_conditions,
              :category_ids,
              :published,
              :discount_value,
              :is_online_product,
              :price,
              :by_points,
              :redeem_points

  attribute :commerce do
    Commerce.find(@object.commerce_id)
  end
  attribute :categories do
    @object.categories
  end
end
