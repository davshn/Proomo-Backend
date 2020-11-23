class Offer < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  Offer.__elasticsearch__.create_index!
  Offer.import(force: true)

  settings do
    mappings dynamic: false do
      indexes :title, type: :text, analyzer: :spanish
      indexes :description, type: :text, analyzer: :spanish
      indexes :published, type: :boolean
      indexes :discount_value, type: :number
    end
  end

  belongs_to :commerce
  has_many :coupons
  has_and_belongs_to_many :categories

  def self.build_search (query, match, sort = {}, page = 1)
    if sort.nil?
      sort = {
        discount_value: { order: 'desc' }
      }
    end
    limit = 10
    from = (limit * page -1)
    self.search({
      sort: {
        discount_value: { order: 'desc' }
      },
      from: 0,
      size: 10,
      query: {
        bool: {
          must: [
            {
              multi_match: {
                query: query,
                fields: [:title, :description],
                type: "phrase_prefix"
              }
            },
            {
              match: {
                published: true,
              }
            }
          ]
        }
      }
    })
  end

  def self.search_published(query, page = 1)
    limit = 10
    page = page.to_i
    from = limit * (page - 1)
    self.search({
      sort: {
        discount_value: { order: 'desc' }
      },
      from: from,
      size: 10,
      query: {
        bool: {
          must: [
            {
              multi_match: {
                query: query,
                fields: [:title, :description],
                type: "phrase_prefix"
              }
            },
            {
              match: {
                published: true,
              }
            }
          ]
        }
      },
      aggs: {
        brands: {
          terms: {
            field: "commerce_id"
          }
        }
      }
    })
  end

  def self.search_published_by_brand (query, commerce, page = 1)
    limit = 10
    page = page.to_i
    from = limit * (page - 1)
    self.search({
      sort: {
        discount_value: { order: 'desc' }
      },
      from: from,
      size: 10,
      query: {
        bool: {
          must: [
            {
              multi_match: {
                query: query,
                fields: [:title, :description],
                type: "phrase_prefix"
              }
            },
            {
              match: {
                published: true,
              }
            },
            {
              match: {
                commerce_id: commerce
              }
            }
          ]
        }
      },
      aggs: {
        brands: {
          terms: {
            field: "commerce_id"
          }
        }
      }
    })
  end

  def self.get_params(exclude = [])
    params = [
      :id,
      :commerce_id,
      :title,
      :description,
      :image,
      :terms_and_conditions,
      :category_ids,
      :published,
      :discount_value
    ]
  end
  mount_base64_uploader :image, ImageUploader
end
