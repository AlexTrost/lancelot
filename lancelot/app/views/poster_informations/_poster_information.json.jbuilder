json.extract! poster_information, :id, :description, :location, :email, :phone, :skype, :website, :user_id, :created_at, :updated_at
json.url poster_information_url(poster_information, format: :json)