class Transaction < ApplicationRecord
  self.primary_key = "transaction_id"
  before_create do
    self.transaction_id ||= SecureRandom.uuid
  end

  def as_json(options = {})
    super(options).except("created_at", "updated_at")
  end
end
