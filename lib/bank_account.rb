class BankAccount
  attr_reader :balance, :transactions

  INITIAL_BALANCE = 0.0

  def initialize
    @balance = INITIAL_BALANCE
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
  end

  def withdrawal(amount)
    @balance -= amount
  end


end
