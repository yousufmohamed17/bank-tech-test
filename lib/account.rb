# require 'date'

class Account
  def initialize
    @transactions = []
    @balance = 0
  end

  def get_transactions
    @transactions
  end

  def current_balance
    @balance
  end

  def deposit(amount:)
    @transactions << Transaction.new(@balance).deposit(amount)
    @balance += amount
  end

  def withdraw(amount:)
    @transactions << Transaction.new(@balance).withdraw(amount)
    @balance -= amount
  end

  def print_statement
    Statement.new(@transactions).print_statement
  end


  # def balance(date:)
  #   @transactions.select { |h| Date.parse(h[:date]) <= Date.parse(date) }.sum { |h| h[:amount] }
  #   # does this work without parsing?
  # end

  # def add_transaction(transaction)
  #   @transactions << transaction
  # end
end