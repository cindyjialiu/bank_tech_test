require 'bank_account'

describe BankAccount do

  describe '#deposit' do
    it 'returns the new balance of the deposit amount plus original balance' do
      bank_account = BankAccount.new
      bank_account.deposit(1000.00)
      expect(bank_account.balance).to eq(1000.00)
  end
end

end
