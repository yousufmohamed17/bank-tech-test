require_relative '../lib/transaction.rb'

describe Transaction do
  let(:account1) { instance_double(Account) }
  let(:subject) { described_class.new(account: account1, date: '01/01/2021') }
  
  it 'should have account and date attributes' do
    expect(subject).to have_attributes(account: account1, date: '01/01/2021')
  end
end