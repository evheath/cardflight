require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  test "parses tags from raw message" do
    t = Transaction.new(raw_message: "309SMAINFRMR108DISCOVER2070100.95502QS")
    t.valid?
    assert_equal "SMAINFRMR", t.merchant
    assert_equal "DISCOVER", t.network
    assert_equal 10095, t.amount
  end

  test "truncates merchants to 10 characters" do
    t = Transaction.new(raw_message: "103JCB502QS316COSTSAVERGROCERY20564.80")
    t.valid?
    assert_equal "COSTSAVERG", t.merchant
  end

  test "creates a valid uuid for transaction_id on save" do
    t = Transaction.create(raw_message: "309SMAINFRMR108DISCOVER2070100.95502QS")
    t.valid?
    assert t.transaction_id.present?
    assert t.transaction_id.is_a?(String)
    assert t.transaction_id.match?(/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/)
  end

  test "creates valid transaction_descriptor for VISA transactions" do
    t = Transaction.create(raw_message: "20522.00104VISA310BURGERBARN")
    t.valid?
    assert_equal "00002200", t.transaction_descriptor
  end

  test "creates valid transaction_descriptor for non VISA transactions" do
    t = Transaction.create(raw_message: "20522.00104ABCD310BURGERBARN")
    t.valid?
    assert_equal "ABFFFF", t.transaction_descriptor
  end

  test "version included in json matches the version method" do
    t = Transaction.new
    assert_equal t.version, t.as_json[:version]
  end

  test "ignores extra tags" do
    t = Transaction.create(raw_message: "309SMAINFRMR108DISCOVER2070100.95502QS702XX")
    t.valid?
    assert t.transaction_id.present?
    assert t.transaction_id.is_a?(String)
    assert t.transaction_id.match?(/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/)
  end
end
