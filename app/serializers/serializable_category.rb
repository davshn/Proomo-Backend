class SerializableCategory < JSONAPI::Serializable::Resource
  type 'users'

  attributes  :id,
              :name,
              :image,
              :concept_name,
              :principal_category_id

  attribute :secundary_categories do
    @object.secundary_categories
  end

  attribute :offers do
    @object.offers
  end

  attribute :commerces do
    @object.commerces
  end
  # has_many :pits
  #
  # attribute :pits do
  #   @object.pits
  # end
end
