require 'printer'

describe Printer do
  let(:credit) { double("credit", credit_amount: 10.00, created_date: "29/01/2017") }
  let(:debit) { double("debit", debit_amount: -10.00, created_date: "27/01/2017") }
  let(:transactions1) { [debit, credit] }
  let(:transactions2) { [credit, debit] }
  subject{ described_class.new}

  it "sort the transactions by date" do
    expect(subject.sort_by_date(transactions1)).to eq(transactions2)
  end


end
