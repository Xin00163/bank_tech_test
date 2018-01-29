require_relative 'credit'
require_relative 'debit'
require_relative 'printer'

class BankAccount
  attr_reader :balance, :transactions, :credit_class, :debit_class

  INITIAL_BALANCE = 0.0

  def initialize(credit_class = Credit, debit_class = Debit, printer = Printer.new)
    @credit_class = credit_class
    @debit_class = debit_class
    @printer = printer
    @balance = INITIAL_BALANCE
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    credit = credit_class.new(amount, @balance)
    @transactions.push(credit)
  end

  def withdrawal(amount)
    raise "Insufficient funds" if @balance < amount
    @balance -= amount
    debit = debit_class.new(amount, @balance)
    @transactions.push(debit)
  end

  def print_statement
    puts @printer.format(transactions)
  end

end
