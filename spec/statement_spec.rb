require_relative '../lib/statement.rb'

describe Statement do
  let(:subject) { described_class.new(transactions) }
  let(:transactions) { [transaction1, transaction2] }
  let(:transaction1) { instance_double(Transaction, date: '01/01/2021', credit: 100, debit: '', balance: 100) }
  let(:transaction2) { instance_double(Transaction, date: '01/01/2021', credit: '', debit: 30, balance: 70) }
  let(:header) { "    date     ||   credit    ||    debit    ||   balance   \n" }
  let(:deposit_array) { " 01/01/2021  ||             ||    30.00    ||    70.00    \n" }
  let(:withdrawal_array) { " 01/01/2021  ||   100.00    ||             ||   100.00    \n" }

  context '#initialize' do
    it 'should require transactions argument to initialize' do
      expect{ Statement.new }.to raise_error ArgumentError
    end

    it 'should initialize with transactions attribute equal to transactions argument' do
      expect(subject.transactions).to eq([transaction1, transaction2])
    end
  end

  context '#print_statement' do
    it 'should print the header when there are no transactions' do
      expect { Statement.new([]).print_statement }.to output(header).to_stdout
    end

    it 'should print the transactions in reverse order with correct format' do
      expect { subject.print_statement }.to output(header + deposit_array + withdrawal_array).to_stdout
    end
  end
end