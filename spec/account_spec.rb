require_relative '../lib/account.rb'
require_relative '../lib/transaction.rb' #delete
require_relative '../lib/statement.rb' #delete

describe Account do
  let(:transaction_class) { class_double(Transaction).as_stubbed_const }
  let(:transaction) { instance_double(Transaction) }
  let(:statement_class) { class_double(Statement).as_stubbed_const }
  let(:statement) { instance_double(Statement) }


  before do
    allow(transaction_class).to receive(:new).and_return(transaction)
    allow(transaction).to receive(:deposit).and_return(transaction)
    allow(transaction).to receive(:withdraw).and_return(transaction)
    allow(statement_class).to receive(:new).and_return(statement)
    allow(statement).to receive(:print_statement)
  end

  context '#initialize' do
    it 'should start with an empty transactions array' do
      expect(subject.get_transactions).to eq([])
    end

    it 'should start with a balance of 0' do
      expect(subject.current_balance).to eq(0)
    end
  end

  context '#deposit' do
    it 'should require an amount argument' do
      expect{ subject.deposit }.to raise_error ArgumentError
    end

    it 'should instantiate a new transaction' do
      expect(transaction_class).to receive(:new).with(subject.current_balance)
      subject.deposit(amount: 500)
    end

    it 'should call #deposit on the transaction instance' do
      expect(transaction).to receive(:deposit).with(500)
      subject.deposit(amount: 500)
    end

    it 'should pass transaction instance into transactions array' do
      expect { subject.deposit(amount: 500) }.to change { subject.get_transactions }.from([]).to([transaction])
    end

    it 'should change balance by deposit amount' do
      expect { subject.deposit(amount: 500) }.to change { subject.current_balance }.from(0).to(500)
    end
  end

  context '#withdraw' do
    it 'should require an amount argument' do
      expect{ subject.withdraw }.to raise_error ArgumentError
    end

    it 'should instantiate a new transaction' do
      expect(transaction_class).to receive(:new).with(subject.current_balance)
      subject.withdraw(amount: 500)
    end

    it 'should call #withdraw on the transaction instance' do
      expect(transaction).to receive(:withdraw).with(500)
      subject.withdraw(amount: 500)
    end

    it 'should pass transaction instance into transactions array' do
      expect { subject.withdraw(amount: 500) }.to change { subject.get_transactions }.from([]).to([transaction])
    end

    it 'should change balance by withdrawal amount' do
      subject.deposit(amount: 500)
      expect { subject.withdraw(amount: 500) }.to change { subject.current_balance }.from(500).to(0)
    end
  end

  context '#print_statement' do
    it 'should instantiate a new statement' do
      expect(statement_class).to receive(:new).with(subject.get_transactions)
      subject.print_statement
    end

    it 'should call #print_statement on the statement instance' do
      expect(statement).to receive(:print_statement)
      subject.print_statement
    end
  end
end