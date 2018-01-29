require 'printer'

describe Printer do
  let(:credit) { double("credit", amount: 10.00, created_date: "29/01/2017", current_balance: 5.00) }
  let(:debit) { double("debit", amount: -10.00, created_date: "27/01/2017", current_balance: -5.00) }
  let(:transactions) { [credit, debit] }
  subject{ described_class.new}


  describe "format" do

    it "format the transactions" do
      expect(subject.format(transactions)).to eq "date   || credit   || debit   || balance   \n29/01/2017 || 10.0  ||   || 5.0 \n27/01/2017 ||  ||  -10.0  || -5.0 \n"
    end
  end
end
