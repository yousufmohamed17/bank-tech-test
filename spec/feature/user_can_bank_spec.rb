require_relative '../../lib/account.rb'

describe Account do
  before do
    allow(Time).to receive_message_chain(:now, :strftime).and_return('01/01/2021')
  end
  
  it 'should print an accurate statement' do
    subject.deposit(amount: 1000)
    subject.deposit(amount: 2000)
    subject.withdraw(amount: 500)
    expect { subject.print_statement }.to output(
      "    date     ||   credit    ||    debit    ||   balance   \n" \
      " 01/01/2021  ||             ||   500.00    ||   2500.00   \n" \
      " 01/01/2021  ||   2000.00   ||             ||   3000.00   \n" \
      " 01/01/2021  ||   1000.00   ||             ||   1000.00   \n" \
    ).to_stdout
  end
end
