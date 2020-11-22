class SerializableCommerce < JSONAPI::Serializable::Resource
  type 'commerces'

  attributes :name,
              :image,
              :description,
              :category_ids,
              :published

  attribute :admin_user do
    User.find_by(commerce_ref: @object.id)
  end
  attribute :offers do
    @object.offers
  end
  attribute :categories do
    @object.categories
  end
  attribute :score do
    if !@object.score.nil?
      @object.score
    else
      0
    end
  end
end
