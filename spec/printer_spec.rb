require 'printer'

describe Printer do
  describe '#print' do
    it 'prints the bank statement' do
      printer = Printer.new
      title = 'date || credit || debit || balance'
      t1 = '23/04/2018 || || 500.00 || 1500.00'
      t2 = '23/04/2018 || 1000.00 || || 2000.00'
      t3 = '23/04/2018 || 2000.00 || || 1000.00'
      statement = title + "\n" + t3 + "\n" + t2 + "\n" + t1
      expect { printer.print(statement) }.to output(statement + "\n").to_stdout
    end
  end
end
