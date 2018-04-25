require_relative 'bank_account'
require_relative 'statement'
require_relative 'transaction'
require_relative 'printer'

account = BankAccount.new
statement = Statement.new
transactions = Transaction.new
printer = Printer.new
t1 = account.deposit(1500, DateTime.now)
transactions.add_transaction(t1)
t2 = account.withdrawal(500, DateTime.now)
transactions.add_transaction(t2)
transaction_history = transactions.history
statement_body = statement.get_statement(transaction_history)
fields = statement.formatted_statement(statement_body)
printer.print(fields)
