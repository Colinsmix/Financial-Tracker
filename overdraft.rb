class Overdraft
  def initialize (balance, transaction)
    @balance = balance
    @date = transaction.date
    @expense = transaction.amount
    @type = transaction.type
  end
end