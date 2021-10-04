require 'date'

class Account
  def initialize
    @transactions = []
  end

  def get_transactions
    @transactions
  end

  def balance(date:)
    @transactions.select { |h| Date.parse(h[:date]) <= Date.parse(date) }.sum { |h| h[:amount] }
    # does this work without parsing?
  end

  def add_transaction(transaction)
    @transactions << transaction
  end
end