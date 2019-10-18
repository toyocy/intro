json.extract! user, :id, :last_name, :first_name, :email, :is_active, :organization_id, :created_at, :updated_at
json.url user_url(user, format: :json)
