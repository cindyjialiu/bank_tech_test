require 'bank_account'

describe BankAccount do

  describe '#deposit' do
    context 'when the original balance is 0' do
      it 'returns the new balance of 1000.00' do
        bank_account = BankAccount.new
        bank_account.deposit(1000.00)
        expect(bank_account.balance).to eq(1000.00)
      end
    end

    context 'when the original balance is 1000' do
      it 'returns the new balance of 2000.00' do
        bank_account = BankAccount.new(1000)
        bank_account.deposit(1000.00)
        expect(bank_account.balance).to eq(2000.00)
      end
    end
  end


end
