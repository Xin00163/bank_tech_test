require_relative 'credit'
require_relative 'debit'
require_relative 'bank_account'

class Printer

  def sort_by_date(transactions)
    transactions.reverse{|transaction| transaction.created_date}
  end
end
