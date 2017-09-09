class Order
  include DataMapper::Resource

  property :id, Serial, key: true, required: false
  #property :created_at, DateTime
  property :pick_up_time, Time

  has n, :order_items
  belongs_to :user

  validates_presence_of :user

  before :save do
    set_pick_up_time
  end

  def add_item(obj, price, qty)
    OrderItem.create(dish: obj, price: price, quantity: qty, order: self)
  end

  def total
    items_total = 0
    self.order_items.each do |item|
      items_total += (item.price * item.quantity)
    end
    items_total
  end

  def set_pick_up_time
    self.pick_up_time = Time.now + 1800
  end

end