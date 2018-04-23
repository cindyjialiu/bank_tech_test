require 'date'
require_relative 'statement'

class BankAccount
  attr_accessor :balance

  def deposit(date, amount, balance)
    new_balance = balance + amount
    transaction = {
      date: date,
      amount: amount,
      balance: new_balance
    }
    [new_balance, transaction]
  end

  def withdrawal(date, amount, balance)
    raise 'Sorry, your balance is too low.' if balance < amount
    new_balance = balance - amount
    transaction = {
      date: date,
      amount: -amount,
      balance: new_balance
    }
    [new_balance, transaction]
  end

end
