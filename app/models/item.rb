class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash [:category, :days_to_ship, :item_condition, :shipping_cost, :shipping_source]

  with_options presence: true do
    validates :item_name
    validates :item_description
    validates :price
  end

  with_options numericality: { other_than: 1 }
    validates :category_id
    validates :item_condition_id
    validates :shipping_cost_id
    validates :shipping_source
    validates :days_to_ship_id
  end
end
