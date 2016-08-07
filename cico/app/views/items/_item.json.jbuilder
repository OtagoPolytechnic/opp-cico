json.extract! item, :id, : name, :price, :asset_num, :notes, :retired_at, :created_at, :updated_at
json.url item_url(item, format: :json)