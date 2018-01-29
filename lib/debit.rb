class Debit
  attr_reader :amount, :current_balance

  def initialize(amount, current_balance)
    @amount = -amount
    @current_balance = current_balance
    @created_at = Time.now
  end

  def created_date
    @created_at.strftime("%d/%m/%Y")
  end

end
