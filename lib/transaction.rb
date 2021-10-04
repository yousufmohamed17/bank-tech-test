class Transaction
  attr_reader :account, :date

  def initialize(account:, date:)
    @account = account
    @date = date
  end
end