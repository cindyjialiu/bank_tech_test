require 'date'
require_relative 'transaction'

class BankAccount
  attr_accessor :balance, :date, :history

  def initialize(transactions = Transaction.new)
    @amount = 0
    @balance = 0
    @transactions = transactions
  end

  def deposit(amount, date)
    transaction = {
      date: date,
      amount: amount,
      balance: @balance += amount
    }
    @transactions.add_transaction(transaction)
  end

  def withdrawal(amount, date)
    raise 'Sorry, your balance is too low.' if @balance < amount
    transaction = {
      date: date,
      amount: -amount,
      balance: @balance -= amount
    }
    @transactions.add_transaction(transaction)
  end
end
