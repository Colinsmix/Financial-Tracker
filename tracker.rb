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
puts colin.first_name + ' ' + colin.last_name
puts "Ending Balance : #{sprintf('%.2f', colin.account.balance)}"
puts "Total Deposited : #{sprintf('%.2f', colin.account.total_deposited)}"
puts "Total Withdrawn : #{sprintf('%.2f', colin.account.total_withdrawn)}"
puts "Total Overdraft Fees : #{sprintf('%.2f', colin.account.overdrafts.length * 20.0)}"
puts
puts 'Overdrafts (balance, expense, description, date'
colin.account.overdrafts.each do |overdraft|
  puts "#{sprintf('%.2f', overdraft.balance)}, #{overdraft.expense}, #{overdraft.type}, #{overdraft.date}"
end