require 'debit'

describe Debit do
  let(:amount) {20.00}
  let(:current_balance) {10.00}
  subject(:debit) { described_class.new(amount, current_balance) }

    it 'should have a debit' do
      expect(subject).to be_a_kind_of(Debit)
    end

    it 'should show the date when the debit is made' do
      expect(subject.created_date.to_s).to eq(Time.now.strftime("%d/%m/%Y").to_s)
    end

    it 'should have an amount' do
      expect(subject.amount).to eq(-20.00)
    end

    it 'should know the current_balance' do
      expect(subject.current_balance).to eq(10.00)
    end
end
