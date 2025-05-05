class Transaction < ApplicationRecord
  def version
    "0.1"
  end
  self.primary_key = "transaction_id"
  before_create do
    self.transaction_id ||= SecureRandom.uuid
  end

  def as_json(options = {})
    super(options).except("created_at", "updated_at").merge(version: version)
  end
end
