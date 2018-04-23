require 'bank_account'

describe BankAccount do

  bank_account = BankAccount.new
  date = Date.new(2018, 4, 23)

  describe '#deposit' do
    context 'when the original balance is 0' do
      it 'returns the new balance 1000.00' do
        expected = [1000, { date: date, amount: 1000, balance: 1000 }]
        expect(bank_account.deposit(date, 1000, 0)).to eq(expected)
      end
    end

  end

  describe '#withdrawal' do
    context 'when the original balance is >= withdrawal amount' do
      it 'returns the new balance 0' do
        bank_account.balance = 1000
        expected = [500, { date: date, amount: -500, balance: 500 }]
        expect(bank_account.withdrawal(date, 500, 1000)).to eq(expected)
      end
    end

    context 'when the original balance is 0' do
      it 'should raise an error' do
        expect { bank_account.withdrawal(date, 1000, 0) }.to raise_error('Sorry, your balance is too low.')
      end
    end
  end

end
