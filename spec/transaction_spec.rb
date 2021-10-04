require_relative '../lib/transaction.rb'
# require Account class?

describe Transaction do
  let(:account1) { instance_double(Account) }
  let(:subject) { described_class.new(account: account1) }

  before do
    allow(Time).to receive_message_chain(:now, :strftime).and_return('01/01/2021')
    allow(account1).to receive(:instance_of?).with(Account).and_return(true)
    allow(account1).to receive(:add_transaction)
    allow(account1).to receive(:balance).with(date: subject.date).and_return(100)
  end

  context '#initialize' do
    it 'should require account argument to initialize' do
      expect{ Transaction.new }.to raise_error ArgumentError
    end

    it 'should raise an error if an account is not valid' do
      expect{ Transaction.new(account: 1) }.to raise_error 'Not a valid account'
    end

    it 'should initialize with date attribute' do
      expect(subject.date).to eq('01/01/2021')
    end
  end

  context '#deposit' do
    it 'should require an amount argument' do
      expect{ subject.deposit }.to raise_error ArgumentError
    end

    it 'should raise an error if the deposit amount is not a number' do
      expect{ subject.deposit(amount: 'test') }.to raise_error 'Amount must be a positive number'
    end

    it 'should raise an error if the deposit amount is not positive' do
      expect{ subject.deposit(amount: -500) }.to raise_error 'Amount must be a positive number'
    end

    it 'should #add_transaction to account' do
      expect(account1).to receive(:add_transaction).with({ amount: 500, date: subject.date })
      subject.deposit(amount: 500)
    end
  end

  context '#withdraw' do
    it 'should require an amount argument' do
      expect{ subject.withdraw }.to raise_error ArgumentError
    end

    it 'should raise an error if the withdrawal amount is not a number' do
      expect{ subject.withdraw(amount: 'test') }.to raise_error 'Amount must be a positive number'
    end

    it 'should raise an error if the withdrawal amount is not positive' do
      expect{ subject.withdraw(amount: -500) }.to raise_error 'Amount must be a positive number'
    end

    it 'should raise an error if the withdrawal amount is greater than the available balance' do
      expect{ subject.withdraw(amount: 500) }.to raise_error 'Insufficient balance'
    end

    it 'should #add_transaction to account' do
      expect(account1).to receive(:add_transaction).with({ amount: -100, date: subject.date })
      subject.withdraw(amount: 100)
    end
  end
end