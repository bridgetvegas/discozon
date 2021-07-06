class ChangePriceDatatype < ActiveRecord::Migration[6.1]
  def change
    change_column(:products, :our_price, :decimal)
  end
end
