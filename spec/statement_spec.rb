require_relative '../lib/statement.rb'

describe Statement do
  let(:account1) { instance_double(Account) }
  let(:subject) { described_class.new(account: account1) }
  let(:transactions) { [
    { amount: 1000, date: '01/01/2021' },
    { amount: 1000, date: '02/01/2021' },
    { amount: -500, date: '03/01/2021' }
    ] }

  before do
    allow(account1).to receive(:instance_of?).with(Account).and_return(true)
    allow(account1).to receive(:get_transactions).and_return(transactions)
    allow(account1).to receive(:balance).with(date: '01/01/2021').and_return(1000)
    allow(account1).to receive(:balance).with(date: '02/01/2021').and_return(2000)
    allow(account1).to receive(:balance).with(date: '03/01/2021').and_return(1500)
  end

  context '#initialize' do
    it 'should require account argument to initialize' do
      expect{ Statement.new }.to raise_error ArgumentError
    end

    it 'should raise an error if an account is not valid' do
      expect{ Statement.new(account: 1) }.to raise_error 'Not a valid account'
    end
  end

  context '#print_statement' do
    it 'should print transactions' do
      expect { subject.print_statement }.to output.to_stdout
    end

    it 'should #get_transactions from account' do
      expect(account1).to receive(:get_transactions)
      subject.print_statement
    end
  end
end