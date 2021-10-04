require_relative '../lib/transaction.rb'
# require Account class?

describe Transaction do
  let(:account1) { instance_double(Account) }
  let(:subject) { described_class.new(account: account1) }

  before do
    allow(account1).to receive(:instance_of?).with(Account).and_return(true)
    allow(Time).to receive_message_chain(:now, :strftime).and_return('01/01/2021')
  end

  context '#initialize' do
    it 'should require account argument to initialize' do
      expect{ Transaction.new }.to raise_error ArgumentError
    end

    it 'should raise an error if account is not valid' do
      expect{ Transaction.new(account: 1) }.to raise_error 'Not a valid account'
    end

    it 'should initialize with date attribute' do
      expect(subject.date).to eq('01/01/2021')
    end

    it 'should initialize with an amount attribute which starts at 0' do
      expect(subject.amount).to eq(0)
    end
  end

  context '#deposit' do
    it 'should require an amount argument' do
      expect{ subject.deposit }.to raise_error ArgumentError
      # expect{ subject.deposit(amount: 0) }.not_to raise_error
    end

    it 'should raise an error if the deposit amount is not a number' do
      expect{ subject.deposit(amount: 'test') }.to raise_error 'Deposit amount must be a number'
    end

    it 'should raise an error if the deposit amount is not positive' do
      expect{ subject.deposit(amount: -500) }.to raise_error 'Deposit amount must be positive'
    end
  end
end