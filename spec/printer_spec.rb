require 'printer'

describe Printer do
  describe '#print' do
    printer = Printer.new
    title = %w[date credit debit balance]
    t1 = ['23/04/2018', '', '500.00', '1500.00']
    statement = [title, t1]
    expected_title = 'date || credit || debit || balance'
    expected_t1 = '23/04/2018 ||  || 500.00 || 1500.00'
    expected = [expected_title, expected_t1].join("\n") + "\n"
    it 'prints the bank statement' do
      expect { printer.print(statement) }.to output(expected).to_stdout
    end
  end
end
