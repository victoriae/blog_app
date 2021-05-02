json.extract! article, :id, :category_id, :title, :content, :user_id, :active, :created_at, :updated_at
json.url article_url(article, format: :json)
