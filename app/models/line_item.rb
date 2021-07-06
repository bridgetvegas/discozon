class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart



  # LOGIC
  def total_price
    self.quantity * self.product.our_price
  end
end
