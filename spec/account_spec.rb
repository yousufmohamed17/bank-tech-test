require_relative '../lib/account.rb'

describe Account do
  it 'should initialise with an empty array' do
    expect(subject.transactions).to eq([])
  end

  it '#balance should require date argument' do
    expect{ subject.balance }.to raise_error ArgumentError
    expect{ subject.balance(date: '01-01-2021') }.not_to raise_error
  end
end