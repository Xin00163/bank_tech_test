require "bank_account"

describe BankAccount do
  subject{described_class.new()}

  it "have an initial balance" do
    bank_account = BankAccount.new
    expect(bank_account.balance).to eq(0.0)
  end

  it "allows user to desposit money" do
    bank_account = BankAccount.new
    bank_account.deposit(20.00)
    expect(bank_account.balance).to eq(20.00)
  end

end
