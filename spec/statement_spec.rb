require 'statement'

describe Statement do
  subject(:statement) { described_class.new }
  date = Date.new(2018, 4, 23)

  describe '#get_data' do
    it 'returns the transaction details' do
      transaction = {
        date: date,
        amount: 1000,
        balance: 1000
      }
      expected = '23/04/2018 || 1000.00 || || 1000.00'
      expect(statement.get_data(transaction)).to eq expected
    end
  end
end
