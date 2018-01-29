require "bank_account"

describe BankAccount do
  subject{described_class.new()}

  it "have an initial balance" do
    bank_account = BankAccount.new
    expect(bank_account.balance).to eq(0)
  end


end
