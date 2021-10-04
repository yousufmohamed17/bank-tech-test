require_relative '../lib/account.rb'

describe Account do
  it 'should initialise with an empty array' do
    p Account.new
    expect(subject.transactions).to eq([])
  end
end