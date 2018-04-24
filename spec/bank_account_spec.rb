require 'bank_account'

describe BankAccount do
  subject(:bank_account) { described_class.new }
  date = Date.new(2018, 4, 23)

  describe '#deposit' do
    context 'when the original balance is 0' do
      it 'returns the new balance 1000.' do
        expected = {
          date: date,
          amount: 1000,
          balance: 1000
        }
        expect(bank_account.deposit(1000, date)).to eq expected
      end
    end
  end

  describe '#withdrawal' do
    context 'when the original balance is >= withdrawal amount' do
      it 'returns the new balance 0' do
        bank_account.balance = 1000
        expected = {
          date: date,
          amount: -500,
          balance: 500
        }
        expect(bank_account.withdrawal(500, date)).to eq expected
      end
    end

    context 'when the original balance is 0' do
      it 'should raise an error' do
        error_message = 'Sorry, your balance is too low.'
        expect { bank_account.withdrawal(1000, date) }.to raise_error(error_message)
      end
    end
  end
end
