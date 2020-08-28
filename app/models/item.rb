class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :prefecture

  validates :name, :price, :introduction, :category_id, :item_condition_id, :prefecture_id,:postage_type_id, :preparation_id, :user_id, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id, :item_condition_id, :postage_type_id,:prefecture_id
  end
end