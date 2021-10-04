class Transaction
  attr_reader :date, :amount
  def initialize(account:)
    @account = account if account_valid?(account)
    @date = Time.now.strftime('%d/%m/%Y')
    @amount = 0
  end

  def deposit(amount:)
    @amount += amount if amount_valid?(amount)
  end

  def withdraw(amount:)
    @amount -= amount if amount_valid?(amount) && sufficient_balance?(amount)
  end

  private

  def account_valid?(account)
    raise 'Not a valid account' unless account.instance_of?(Account)
  end

  def amount_valid?(amount)
    raise 'Requested amount must be a number' unless amount.is_a?(Integer) || amount.is_a?(Float)
    raise 'Requested amount must be positive' if amount <= 0
  end

  def sufficient_balance?(amount)
    raise 'Insufficient balance' if amount > @account.balance
  end
end