class ChangeDefaultPrice < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:products, :our_price, 0.0)
  end
end
