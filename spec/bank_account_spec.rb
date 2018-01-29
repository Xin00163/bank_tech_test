require "bank_account"
require "printer"

describe BankAccount do
  let(:credit_class) { double(:credit_class) }
  let(:debit_class) { double(:debit_class) }
  let(:credit) { double("credit", credit_amount: 10.00, created_date: "29/01/2017") }
  let(:debit) { double("debit", debit_amount: -10.00, created_date: "29/01/2017") }
  let(:credit_amount) { 10.00 }
  let(:debit_amount) { 10.00 }
  let(:printer) { double("printer") }

  subject{ described_class.new(credit_class, debit_class, printer) }

  context "When creating a bank account" do
    it "have an initial balance" do
      bank_account = BankAccount.new
      expect(bank_account.balance).to eq(0.0)
    end

    it "has no transactions at the beginning" do
      bank_account = BankAccount.new
      expect(bank_account.transactions).to eq([])
    end
  end

  describe "deposit" do
    let(:current_balance) { 10.00 }

    before do
      allow(credit_class).to receive(:new).with(credit_amount, current_balance){ credit }
    end

    it "allows user to desposit money and increase the transactions's number" do
      expect{subject.deposit(credit_amount)}.to change{subject.balance}.by(credit_amount)
      expect(subject.transactions.length).to eq(1)
    end

    it "includes the credit transaction" do
      subject.deposit(credit_amount)
      expect(subject.transactions[0]).to eq(credit)
    end
  end

  describe "withdrawal" do
    let(:added_balance) { 10.00 }
    let(:current_balance) { 0.00 }

    before do
      allow(credit_class).to receive(:new).with(credit_amount, added_balance)
      subject.deposit(credit_amount)
      allow(debit_class).to receive(:new).with(debit_amount, current_balance){ debit }
    end

    it "allows user to withdrawal money and automatically increase the transactions's number" do
      expect{ subject.withdrawal(debit_amount) }.to change{ subject.balance }.by(-10.00)
      expect(subject.transactions.length).to eq(2)
    end

    it "includes the debit transaction" do
      subject.withdrawal(debit_amount)
      expect(subject.transactions[1]).to eq(debit)
    end

    it 'will raise an error when the balance is less than the amount' do
      expect { subject.withdrawal(20.00) }.to raise_error 'Insufficient funds'
    end
  end

  describe "print statements" do
    it "calls the printer to print the bank statement" do
      expect(printer).to receive(:format)
      subject.print_statement
    end
  end
end
