require 'transaction'
require 'date'

describe Transaction do
  describe '#add_transaction' do
    it 'adds the transaction to history' do
      transactions = Transaction.new
      date = Date.new(2018, 4, 23)
      transaction = {
        date: date,
        amount: -500,
        balance: 500
      }
      transactions.add_transaction(transaction)
      expect(transactions.history).to eq([transaction])
    end
  end
end
