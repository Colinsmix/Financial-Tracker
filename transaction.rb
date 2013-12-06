class Transaction
  attr_reader :date, :amount, :type
  def initialize(date,amount=0,type)
    @date = date
    @amount = amount.to_f
    @type = type || 'Unlabeled'
  end
end