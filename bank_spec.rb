require 'rspec'
require 'pry'
require_relative 'customer'
require_relative 'transaction'
require_relative 'bank'
require_relative 'transaction_reader'

  describe Bank do
    let(:transaction) {Transaction.new('2012-01-01',1500.0,'payday')}
    let(:customer_example) {Customer.new(22,22,22)}

    it 'updates the balance after a transaction is processed' do
      expect(Bank.process_transaction(transaction, customer_example).customer.balance).to eql("1500.0")
    end
    it 'updates the total income after a transaction is processed'
    it 'updates the total expenses after a transaction is processed'
    it 'creates a record of an overdraft'
  end