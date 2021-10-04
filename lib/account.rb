class Account
  def initialize
    @transactions = []
  end

  def get_transactions
    @transactions
  end

  def balance(date:)
    @transactions.select { |h| h[:date] <= date }.sum { |h| h[:amount] }
  end

  def add_transaction(transaction)
    @transactions << transaction
  end
end