class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :their_price, default: 0
      t.float :our_price, default: 0
      t.string :description
      t.string :photo

      t.timestamps
    end
  end
end
