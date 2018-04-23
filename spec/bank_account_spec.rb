require 'bank_account'

describe BankAccount do

  describe '#deposit' do
    context 'when the original balance is 0' do
      it 'returns the new balance 1000.00' do
        bank_account = BankAccount.new
        expect(bank_account.deposit(1000)).to eq({
           bank_account.date => {
             credit: 1000.00,
             debit: 0,
             balance: 1000.00
            }
          }
      )
      end
    end

    context 'when the original balance is 1000' do
      it 'returns the new balance 2000.00' do
        bank_account = BankAccount.new(1000)
        expect(bank_account.deposit(1000)).to eq({
           bank_account.date => {
             credit: 1000.00,
             debit: 0,
             balance: 2000.00
            }
          }
      )
      end
    end
  end

  describe '#withdrawal' do
    context 'when the original balance is >= withdrawal amount' do
      it 'returns the new balance 0' do
        bank_account = BankAccount.new(1000)
        bank_account.withdrawal(1000)
        expect(bank_account.balance).to eq(0)
      end
    end

    context 'when the original balance is 0' do
      it 'should raise an error' do
        bank_account = BankAccount.new
        expect { bank_account.withdrawal(1000) }.to raise_error('Sorry, your balance is too low.')
      end
    end
  end

end
