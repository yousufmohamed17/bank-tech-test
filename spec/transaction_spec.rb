require_relative '../lib/transaction.rb'
# require Account class?

describe Transaction do
  let(:account1) { instance_double(Account) }
  let(:subject) { described_class.new(account: account1, date: '01/01/2021') }

  context '#initialize' do
    it 'should require account and date arguments to initialize' do
      expect{ Transaction.new }.to raise_error ArgumentError
      expect{ subject }.not_to raise_error
    end

    it 'should have an amount argument which starts at 0' do
      expect(subject.amount).to eq(0)
    end
  end

  context '#deposit' do
    it 'should require amountargument' do
      expect{ subject.deposit }.to raise_error ArgumentError
      expect{ subject.deposit(amount: 0) }.not_to raise_error
    end

    it 'should raise an error if the date is not valid' do
      
    end
  end
end