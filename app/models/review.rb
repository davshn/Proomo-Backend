class Review < ApplicationRecord
  belongs_to :client
  belongs_to :commerce

  validates :score, numericality: { less_than_or_equal_to: 5 }

  after_save :set_score_on_commerce


  def self.get_params(exclude = [])
    params = [
      :id,
      :client_id,
      :score,
      :commerce_id
    ]
  end

  def self.exits_review? (client_id, commerce_id)
    !find_by(client_id: client_id, commerce_id: commerce_id).nil?
  end

  private
  def set_score_on_commerce
    self.commerce.score = self.commerce.reviews.average(:score)
    self.commerce.save
  end
end
