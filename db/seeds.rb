# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
CSV.foreach(Rails.root.join("db/seeds_data/fake_amazon_3.csv"), headers: true) do |row|
  Product.find_or_create_by(name: row[0], description: row[1], list_price: row[2], our_price: row[3], photo: row[4])
end
