json.array!(@articles) do |article|
  json.extract! article, :title, :link, :description, :pub_date, :comments, :starred, :channel_id
  json.url article_url(article, format: :json)
end
