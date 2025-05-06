require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  test "parses tags from raw message" do
    t = Transaction.new(raw_message: "309SMAINFRMR108DISCOVER2070100.95502QS")
    t.valid? # triggers before_validation hooks
    assert_equal "SMAINFRMR", t.merchant
    assert_equal "DISCOVER", t.network
    assert_equal 10095, t.amount
  end

  test "truncates merchants to 10 characters" do
    t = Transaction.new(raw_message: "103JCB502QS316COSTSAVERGROCERY20564.80")
    t.valid? # triggers before_validation hooks
    assert_equal "COSTSAVERG", t.merchant
  end
end
