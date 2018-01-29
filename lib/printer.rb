require_relative 'credit'
require_relative 'debit'
require_relative 'bank_account'

class Printer

  def format(transactions)
    output = "date   || credit   || debit   || balance   \n"

    transactions.sort{ |a, b| b.created_date <=> a.created_date }
    .each do |transaction|
      if transaction.amount > 0
        template = "%{date} || %{amount}  ||   || %{balance} \n"
        output += template %{ date: transaction.created_date, amount: transaction.amount, balance: transaction.current_balance}
      else
        template = "%{date} ||  ||  %{amount}  || %{balance} \n"
        output += template %{ date: transaction.created_date, amount: transaction.amount, balance: transaction.current_balance}
      end
    end

    output
  end

end
