class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation
  has_one_attached :image
  has_one :order

  validates :price, :numericality => { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999 }
  validates :name, :price, :introduction, :user_id, :image, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id, :item_condition_id, :postage_type_id,:prefecture_id,:preparation_id
  end
end