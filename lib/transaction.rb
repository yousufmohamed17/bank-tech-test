class Transaction
  attr_reader :account, :date, :amount
  def initialize(account:)
    @account = account if account_valid?(account)
    @date = Time.now.strftime('%d/%m/%Y')
    @amount = 0
  end

  def deposit(amount:)
    @amount += amount if amount_valid?(amount)
    @account.add_transaction({ amount: @amount, date: @date })
  end

  def withdraw(amount:)
    @amount -= amount if amount_valid?(amount) && sufficient_balance?(amount)
    @account.add_transaction({ amount: @amount, date: @date })
  end

  private

  def account_valid?(account)
    account.instance_of?(Account) ? true : (raise 'Not a valid account')
  end

  def amount_valid?(amount)
    raise 'Requested amount must be a number' unless amount.is_a?(Integer) || amount.is_a?(Float)
    raise 'Requested amount must be positive' if amount <= 0
  end

  def sufficient_balance?(amount)
    raise 'Insufficient balance' if amount > @account.balance(date: @date)
  end
end