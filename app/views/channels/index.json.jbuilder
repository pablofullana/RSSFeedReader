json.array!(@channels) do |channel|
  json.extract! channel, :url, :name, :user_id
  json.url channel_url(channel, format: :json)
end
