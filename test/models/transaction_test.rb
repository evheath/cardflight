require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  test "parses merchant and amount correctly from raw message" do
    raw = "309SMAINFRMR108DISCOVER2070100.95"
    t = Transaction.new(raw_message: raw)
    t.valid? # triggers before_validation hooks

    assert_equal "SMAINFRMR", t.merchant
    assert_equal "DISCOVER", t.network
    assert_equal 10095, t.amount
  end
end
