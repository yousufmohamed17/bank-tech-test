class Statement
  attr_reader :transactions
  
  def initialize(transactions)
    @transactions = transactions
  end

  def print_statement
    print_header
    @transactions.reverse.each {
      |t| print_body([t.date, t.credit, t.debit, t.balance])
    }
  end

  private

  def print_header
    format(['date', 'credit', 'debit', 'balance'])
  end

  def print_body(array)
    format(array)
  end

  def format(array)
    puts array.map { |ele| decimal(ele).center(13) }.join("||")
  end

  def decimal(ele)
    ele.is_a?(Integer) ? ele.to_s + ".00" : ele
  end
end
