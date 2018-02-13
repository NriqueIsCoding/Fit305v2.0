json.extract! customer, :id, :username, :last_name, :first_name, :email, :password_digest, :created_at, :updated_at
json.url customer_url(customer, format: :json)
