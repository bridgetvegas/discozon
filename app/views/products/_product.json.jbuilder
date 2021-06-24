json.extract! product, :id, :name, :description, :list_price, :our_price, :photo, :created_at, :updated_at
json.url product_url(product, format: :json)
