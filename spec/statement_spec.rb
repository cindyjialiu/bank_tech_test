require 'statement'

describe Statement do
  subject(:statement) { described_class.new }
  date = Date.new(2018, 4, 23)

  describe '#get_data' do
    it 'returns the transaction details with credit' do
      transaction = {
        date: date,
        amount: 1000,
        balance: 1000
      }
      expected = ['23/04/2018', '1000.00', '', '1000.00']
      expect(statement.get_data(transaction)).to eq expected
    end

    it 'returns the transaction details with debit' do
      transaction = {
        date: date,
        amount: -1000,
        balance: 1000
      }
      expected = ['23/04/2018', '', '1000.00', '1000.00']
      expect(statement.get_data(transaction)).to eq expected
    end
  end

  describe '#get_statement' do
    it 'returns the full statement' do
      transactions = [
        {
          date: date,
          amount: -500,
          balance: 1500
        },
        {
          date: date,
          amount: 1000,
          balance: 2000
        }
      ]
      t1 = ['23/04/2018', '', '500.00', '1500.00']
      t2 = ['23/04/2018', '1000.00', '', '2000.00']
      expected = [t2, t1]
      expect(statement.get_statement(transactions)).to eq expected
    end
  end

  describe '#formatted_statement' do
    it 'returns the formatted statement' do
      statement_body = [
        ['23/04/2018', '', '500.00', '1500.00'],
        ['23/04/2018', '1000.00', '', '2000.00']
      ]
      expected = [
        ['date      ', 'credit    ', 'debit     ', 'balance   '],
        ['23/04/2018', '          ', '500.00    ', '1500.00   '],
        ['23/04/2018', '1000.00   ', '          ', '2000.00   ']
      ]
      expect(statement.formatted_statement(statement_body)).to eq expected
    end
  end
end
