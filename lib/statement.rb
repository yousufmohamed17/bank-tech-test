class Statement
  def initialize(account:)
    validate_account(account)
    @account = account
  end

  def print_statement
    puts 'date || credit || debit || balance'
    @account.get_transactions.reverse.each do
      |h| puts "#{h[:date]} || #{h[:amount] if h[:amount] > 0}|| #{-h[:amount] if h[:amount] < 0}|| #{@account.balance(date: h[:date])}"
    end 
  end

  private

  def validate_account(account)
    raise 'Not a valid account' unless account.instance_of?(Account)
  end
end
