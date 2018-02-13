json.extract! instructor, :id, :username, :last_name, :first_name, :email, :password_digest, :created_at, :updated_at
json.url instructor_url(instructor, format: :json)
