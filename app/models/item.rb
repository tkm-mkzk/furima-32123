class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_source
  belongs_to_active_hash :days_to_ship

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_description
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :item_condition_id
    validates :shipping_cost_id
    validates :shipping_source_id
    validates :days_to_ship_id
  end

  validates :price, presence: true

  validates :price, numericality: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width numbers"}

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
end
