class Transaction < ApplicationRecord
  self.primary_key = "transaction_id"

  before_validation :parse_raw_message, on: :create

  validate :raw_message_format_valid

  before_create do
    self.transaction_id ||= SecureRandom.uuid
  end

  def version
    "0.1"
  end

  def as_json(options = {})
    super(options).except("created_at", "updated_at").merge(version: version, amount: amount.to_s)
  end

  private
    # destructive method to pop x letters from the string
    def pop_x_letters!(str, x)
      popped = str.slice!(0, x)
      popped
    end

    def parse_raw_message
      return if raw_message.blank?

      # parse the tags
      working_string = raw_message.dup
      until working_string.empty?
        tag = pop_x_letters!(working_string, 1)
        length = pop_x_letters!(working_string, 2).to_i
        if length == 0
          @parsing_error = "length for tag '#{tag}' could not be parsed from '#{raw_message}'"
          break
        end
        case tag
        when "1"
          self.network = pop_x_letters!(working_string, length)
        when "2"
          amount = pop_x_letters!(working_string, length).to_f
          self.amount = (amount * 100).to_i
        when "3"
          self.merchant = pop_x_letters!(working_string, length)
        else
          @parsing_error = "unknown tag '#{tag}' in '#{raw_message}'"
          break
        end
      end

      # handle transaction_descriptor
      case self.network
      when "VISA"
        self.transaction_descriptor = self.amount.to_s.rjust(8, "0")
      else
        @parsing_error = "unknown network '#{self.network}' in '#{raw_message}'"
      end
    end

    def raw_message_format_valid
      errors.add(:raw_message, "must be present") if raw_message.blank?
      errors.add(:raw_message, "must be a string") unless raw_message.is_a?(String)
      errors.add(:raw_message, @parsing_error) if @parsing_error.present?
    end
end
