class TransactionReader
  def self.get_transactions(transactions_file)
    transactions = []
    CSV.foreach(transactions_file, headers: true) do |line|
      transactions << Transaction.new(line['date'],line['amount'],line['description'])
    end
    transactions
  end
end