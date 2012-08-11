class Garment < ActiveRecord::Base
  attr_accessible :brand, :description, :date_bought, :price

  belongs_to :user

  validates :description, presence: true, length: { maximum: 255 }
  validates :user_id,     presence: true

  default_scope order: 'garments.created_at DESC'

  def self.from_user_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user)
  end
end
