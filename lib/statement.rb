# require_relative 'bank_account'
#
# class Statement
#
#   def get_statement(history)
#     history.map do |transaction|
#       if transaction[:credit].zero?
#         { date: transaction[:date], debit: transaction[:debit], balance: transaction[:balance]}
#       else
#         { date: transaction[:date], credit: transaction[:credit], balance: transaction[:balance]}
#       end
#     end
#   end
#
#   def print_statement(statement)
#     headline = 'date || credit || debit || balance'
#
#     puts headline +
#   end
#
# end
