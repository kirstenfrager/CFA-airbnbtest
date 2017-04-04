json.extract! room, :id, :price, :description, :title, :user_id, :capacity, :pets, :smoking, :wifi, :bathrooms, :bath, :parties, :created_at, :updated_at
json.url room_url(room, format: :json)
