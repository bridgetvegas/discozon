class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.float :list_price
      t.float :our_price
      t.string :photo

      t.timestamps
    end
  end
end
