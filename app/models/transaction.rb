class Transaction < ApplicationRecord
  self.primary_key = "transaction_id"
  before_create do
    self.transaction_id ||= SecureRandom.uuid
  end
end
