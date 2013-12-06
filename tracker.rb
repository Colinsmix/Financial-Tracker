require 'pry'
require 'csv'
require_relative 'customer'
require_relative 'transaction'
require_relative 'bank'
require_relative 'transaction_reader'
require_relative 'overdraft'
require_relative 'account'

colin = Customer.new('Colin','Shields',Account.new(TransactionReader.get_transactions('transactions.csv')))
colin.account.process_transactions
puts "Ending Balance : #{sprintf('%.2f', colin.account.balance)}"
puts "Total Deposited : #{sprintf('%.2f', colin.account.total_deposited)}"
puts "Total Withdrawn : #{sprintf('%.2f', colin.account.total_withdrawn)}"
puts "Total Overdraft Fees : #{sprintf('%.2f', colin.account.overdrafts.length * 20.0)}"