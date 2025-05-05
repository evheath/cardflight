json.extract! transaction, :id, :raw_message, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
