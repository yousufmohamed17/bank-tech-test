class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(balance)
    @date = Time.now.strftime('%d/%m/%Y')
    @credit = ""
    @debit = ""
    @balance = balance
  end

  def deposit(amount)
    validate_amount(amount)
    @credit = amount
    @balance += amount
    self
  end

  def withdraw(amount)
    validate_amount(amount)
    check_balance(amount)
    @debit = amount
    @balance -= amount
    self
  end

  private

  def validate_amount(amount)
    raise 'Amount must be a positive integer' unless amount.is_a?(Integer) && amount > 0
  end

  def check_balance(amount)
    raise 'Insufficient balance' if amount > @balance
  end
end