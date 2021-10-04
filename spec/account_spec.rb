require_relative '../lib/account.rb'

describe Account do
  it 'should initialize with an empty transactions array' do
    expect(subject.transactions).to eq([])
  end

  context '#balance' do
    it 'should require date argument' do
      expect{ subject.balance }.to raise_error ArgumentError
      expect{ subject.balance(date: '01/01/2021') }.not_to raise_error
    end
  end
end