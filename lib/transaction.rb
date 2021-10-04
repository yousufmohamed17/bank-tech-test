class Transaction
  attr_reader :date, :amount
  def initialize(account:)
    @account = account if account_valid?(account)
    @date = Time.now.strftime('%d/%m/%Y')
    @amount = 0
  end

  def deposit(amount:)
  end

  private

  def account_valid?(account)
    raise 'Not a valid account' unless account.instance_of?(Account)
  end
end