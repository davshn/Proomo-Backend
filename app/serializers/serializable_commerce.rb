class SerializableCommerce < JSONAPI::Serializable::Resource
  type 'commerces'

  attributes :name,
              :image,
              :description,
              :category_ids,
              :city,
              :contact_email,
              :published,
              :partner_id,
              :nit

  attribute :admin_user do
    User.find_by(commerce_ref: @object.id)
  end
  attribute :offers do
    @object.offers
  end
  attribute :categories do
    @object.categories
  end

  attribute :is_online_commerce do
    @object.offers.where(is_online_product: true).any? ? true : false
  end
end
