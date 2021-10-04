class Account
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def balance(date:)
    @transactions.sum { |h| h[:amount] }
  end

  def add_transaction(transaction)
  end
end