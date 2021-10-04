require_relative '../lib/account.rb'

describe Account do
  before do
    subject.add_transaction({ amount: 1000, date: '01/01/2021' })
    subject.add_transaction({ amount: 1000, date: '02/01/2021' })
  end

  context '#initialize' do
    it 'should start with an empty transactions array' do
      expect(Account.new.get_transactions).to eq([])
    end
  end

  context '#balance' do
    it 'should require date argument' do
      expect{ subject.balance }.to raise_error ArgumentError
    end

    it 'should return sum of transaction amounts' do
      expect(subject.balance(date: '02/01/2021')).to eq(2000)
    end

    it 'should not include transactions past given date' do
      expect(subject.balance(date: '01/01/2021')).to eq(1000)
    end
  end

  context '#add_transaction' do
    it 'should add given transactions to transactions array' do
      expect(subject.get_transactions).to eq([
        { amount: 1000, date: '01/01/2021' },
        { amount: 1000, date: '02/01/2021' }
        ])
    end
  end
end