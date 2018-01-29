class BankAccount
  attr_reader :balance, :transactions, :credit_class, :debit_class

  INITIAL_BALANCE = 0.0

  def initialize(credit_class = Credit, debit_class = Debit)
    @credit_class = credit_class
    @debit_class = debit_class
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
