# require 'statement'
#
# describe Statement do
#
#   describe '#get_statement' do
#     it 'prints the history of transaction so far' do
#       statement = Statement.new
#       history = [
#         { date: :"23/04/2018", credit: 1000.0, debit: 0.0, balance: 1000.0 },
#         { date: :"23/04/2018", credit: 0.0, debit: 500.0, balance: 500.0 },
#         { date: :"23/04/2018", credit: 0.0, debit: 300.0, balance: 800.0 }
#       ]
#       expect(statement.get_statement(history)).to eq([
#         { date: :"23/04/2018", credit: 1000.0, balance: 1000.0 },
#         { date: :"23/04/2018", debit: 500.0, balance: 500.0 },
#         { date: :"23/04/2018", debit: 300.0, balance: 800.0 }
#       ])
#     end
#   end
#
# end
