class Account
  attr_reader :balance, :transactions, :overdrafts
  def initialize(transactions, balance=0, deposited=0, withdrawn=0)
    @transactions = transactions
    @balance = balance
    @deposited = deposited
    @withdrawn = withdrawn
    @overdrafts = []
  end

  def process_transactions
    @transactions.each do |transaction|
      @balance += transaction.amount
      if @balance < 0
        @overdrafts << Overdraft.new(@balance, transaction)
        @balance -= 20.0
      end
    end
  end

  def total_deposited
    @transactions.each do |transaction|
      @deposited += transaction.amount if transaction.amount > 0
    end
    @deposited
  end

  def total_withdrawn
    @transactions.each do |transaction|
      @withdrawn += transaction.amount if transaction.amount < 0
    end
    @withdrawn.abs
  end
end