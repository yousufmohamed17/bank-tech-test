class Transaction
  attr_reader :amount
  def initialize(account:, date:)
    @account = account if account_valid?(account)
    @date = date
    @amount = 0
  end

  def deposit(amount:)
  end

  private

  def account_valid?(account)
    raise 'Not a valid account' unless account.instance_of?(Account)
  end
end