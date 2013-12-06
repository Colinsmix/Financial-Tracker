class Customer
  attr_reader :first_name, :last_name, :account
  def initialize (first_name,last_name, account)
    @first_name = first_name
    @last_name = last_name
    @account = account
  end
end