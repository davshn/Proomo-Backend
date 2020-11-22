class SerializableOfferSearch < JSONAPI::Serializable::Resource
  type 'offers'

  attributes :id # For some reason the mapping below doesn't work with :id
              [
                :commerce_id
                :title,
                :description,
                :image,
                :terms_and_conditions,
                :category_ids,
                :published,
                :discount_value
              ].map{|a| attribute(a) {object.:_source[a]}}

  attribute :commerce do
    Commerce.find(@object.commerce_id)
  end
  attribute :id do
    object[:_source].id
  end
  attribute :terms_and_conditions do
  end
  attribute :categories do
    @object.categories
  end
end
