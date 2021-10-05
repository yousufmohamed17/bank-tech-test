require_relative '../lib/transaction.rb'

describe Transaction do
  let(:subject) { described_class.new(500) }

  before do
    allow(Time).to receive_message_chain(:now, :strftime).and_return('01/01/2021')
  end

  context '#initialize' do
    it 'should require balance argument to initialize' do
      expect{ Transaction.new }.to raise_error ArgumentError
    end

    it 'should initialize with date attribute' do
      expect(subject.date).to eq('01/01/2021')
    end

    it 'should initialize with credit attribute equal to empty string' do
      expect(subject.credit).to eq("")
    end

    it 'should initialize with debit attribute equal to empty string' do
      expect(subject.debit).to eq("")
    end

    it 'should initialize with balance attribute equal to balance argument' do
      expect(subject.balance).to eq(500)
    end
  end

  context '#deposit' do
    it 'should require an amount argument' do
      expect{ subject.deposit }.to raise_error ArgumentError
    end

    it 'should raise an error if the deposit amount is not an integer' do
      expect{ subject.deposit('test') }.to raise_error 'Amount must be a positive integer'
    end

    it 'should raise an error if the deposit amount is not positive' do
      expect{ subject.deposit(-500) }.to raise_error 'Amount must be a positive integer'
    end

    it 'should add the deposit amount to credit attribute' do
      expect { subject.deposit(500) }.to change { subject.credit }.from("").to(500)
    end

    it 'should add the deposit amount to balance attribute' do
      expect { subject.deposit(500) }.to change { subject.balance }.from(500).to(1000)
    end

    it 'should return itself' do
      expect(subject.deposit(500)).to eq(subject)
    end
  end

  context '#withdraw' do
    it 'should require an amount argument' do
      expect{ subject.withdraw }.to raise_error ArgumentError
    end

    it 'should raise an error if the withdrawal amount is not a integer' do
      expect{ subject.withdraw('test') }.to raise_error 'Amount must be a positive integer'
    end

    it 'should raise an error if the withdrawal amount is not positive' do
      expect{ subject.withdraw(-500) }.to raise_error 'Amount must be a positive integer'
    end

    it 'should raise an error if the withdrawal amount is greater than the available balance' do
      expect{ subject.withdraw(1000) }.to raise_error 'Insufficient balance'
    end

    it 'should add the withdrawal amount to the debit attribute' do
      expect { subject.withdraw(500) }.to change { subject.debit }.from("").to(500)
    end

    it 'should subtract the withdrawal amount from the balance attribute' do
      expect { subject.withdraw(500) }.to change { subject.balance }.from(500).to(0)
    end

    it 'should return itself' do
      expect(subject.withdraw(500)).to eq(subject)
    end
  end
end