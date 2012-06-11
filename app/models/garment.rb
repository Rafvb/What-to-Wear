class Garment < ActiveRecord::Base
  attr_accessible :brand, :description, :date_bought, :price

  belongs_to :user

  validates :description, presence: true, length: { maximum: 255 }
  validates :user_id,     presence: true

  default_scope order: 'garments.created_at DESC'
end
