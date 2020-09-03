class OrderDestination

  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :city, :building_name, :house_number, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :post_code, format:{ with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :house_number
    validates :phone_number, format:{ with: /\A\d{11}\z/ }
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    destination = Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, building_name: building_name, house_number: house_number, phone_number: phone_number, order_id: order.id)
  end
end