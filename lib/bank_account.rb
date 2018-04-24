require 'date'
require_relative 'transaction'
require_relative 'statement'

class BankAccount
  attr_accessor :balance, :date, :transactions

  def initialize
    @balance = 0
  end

  def deposit(amount, date)
    transaction = {
      date: date,
      credit: amount,
      balance: @balance += amount
    }
  end

  def withdrawal(amount, date)
    raise 'Sorry, your balance is too low.' if @balance < amount
    transaction = {
      date: date,
      debit: amount,
      balance: @balance -= amount
    }
  end
end
