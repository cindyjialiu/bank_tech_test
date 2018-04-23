require 'date'
require_relative 'statement'

class BankAccount
  attr_accessor :balance, :date, :history

  def initialize
    @balance = 0
    @history = []
  end

  def deposit(date, amount, balance)
    new_balance = balance + amount
    transaction = {
      date: date,
      amount: amount,
      balance: new_balance
    }
    [new_balance, transaction]
  end

  def withdrawal(amount)
    raise 'Sorry, your balance is too low.' if @balance < amount
    @history << {
      date: @date,
      debit: amount.to_f,
      balance: (@balance -= amount).to_f
    }
  end

  private
  def date
    DateTime.now
  end

end
