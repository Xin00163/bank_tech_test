class BankAccount
  attr_reader :balance

  INITIAL_BALANCE = 0.0

  def initialize
    @balance = INITIAL_BALANCE
  end


  def deposit(amount)
    @balance += amount
  end
end
