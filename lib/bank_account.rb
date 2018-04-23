require 'date'

class BankAccount
  attr_accessor :balance, :date, :history

  def initialize
    @amount = 0
    @balance = 0
    @history = []
  end

  def deposit(amount, date)
    transaction = {
      date: date,
      amount: amount,
      balance: @balance += amount
    }
    @history << transaction
  end

  def withdrawal(amount, date)
    raise 'Sorry, your balance is too low.' if @balance < amount
    transaction = {
      date: date,
      amount: -amount,
      balance: @balance -= amount
    }
    @history << transaction
  end
end
