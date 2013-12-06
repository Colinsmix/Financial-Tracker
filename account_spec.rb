require 'rspec'
require 'pry'
require_relative 'customer'
require_relative 'transaction'
require_relative 'bank'
require_relative 'transaction_reader'
require_relative 'account'

  describe Account do
    let(:transaction_array) {[Transaction.new('2012-01-01',1500.0,'payday'),Transaction.new('2012-02-01',-1400.0,'gambling')]}
    let(:transaction_array_overdrawn) {[Transaction.new('2012-01-01',1500.0,'payday'),Transaction.new('2012-02-01',-1600.0,'gambling')]}
    let(:single_transaction) {Transaction.new('2012-01-01',1500.0,'payday')}
    let(:new_account) {Account.new(transaction_array)}
    let(:new_account_overdrawn) {Account.new(transaction_array_overdrawn)}

    it 'updates the balance after a transaction is processed' do
      new_account.process_transaction(single_transaction)
      expect(new_account.balance).to eql(1500.0)
    end
    it 'updates the balance after two transactions are processed' do
      new_account.transactions.each do |transaction|
        new_account.process_transaction(transaction)
      end
      expect(new_account.balance).to eql (100.0)
    end

    it 'updates the total income after the transactions are processed' do
      expect(new_account.total_deposited).to eql(1500.0)
    end

    it 'updates the total expenses after the transactions are processed' do
      expect(new_account.total_withdrawn).to eql(1400.0)
    end

    it 'adds an overdraft fee to total_withdrawn ' do
      new_account_overdrawn.transactions.each do |transaction|
        new_account_overdrawn.process_transaction(transaction)
      end
      expect(new_account_overdrawn.balance).to eql (-120.0)
    end


  end