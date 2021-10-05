class Account
  require_relative './transaction.rb'
  require_relative './statement.rb'
  
  attr_reader :transactions, :balance

  def initialize
    @transactions = []
    @balance = 0
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
end
