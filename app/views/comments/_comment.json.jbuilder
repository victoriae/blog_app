json.extract! comment, :id, :user_id, :article_id, :comment, :active, :created_at, :updated_at
json.url comment_url(comment, format: :json)
