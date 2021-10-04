class Transaction
  attr_reader :amount
  def initialize(account:, date:)
    @account = account
    @date = date
    @amount = 0
  end

  def deposit(amount:)
  end
end