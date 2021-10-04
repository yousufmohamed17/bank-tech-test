class Transaction
  attr_reader :date, :amount
  def initialize(account:)
    validate_account(account)
    @account = account
    @date = Time.now.strftime('%d/%m/%Y')
  end

  def deposit(amount:)
    validate_amount(amount)
    @account.add_transaction({ amount: amount, date: @date })
  end

  def withdraw(amount:)
    validate_amount(amount)
    check_balance(amount)
    @account.add_transaction({ amount: -amount, date: @date })
  end

  private

  def validate_account(account)
    raise 'Not a valid account' unless account.instance_of?(Account)
  end

  def validate_amount(amount)
    raise 'Amount must be a positive number' unless (amount.is_a?(Integer) || amount.is_a?(Float)) && amount > 0
  end

  def check_balance(amount)
    raise 'Insufficient balance' if amount > @account.balance(date: @date)
  end
end