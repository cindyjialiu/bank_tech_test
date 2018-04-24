require 'date'

class BankAccount
  attr_accessor :balance, :date

  def initialize
    @balance = 0
  end

  def deposit(amount, date)
    {
      date: date,
      amount: amount,
      balance: @balance += amount
    }
  end

  def withdrawal(amount, date)
    raise 'Sorry, your balance is too low.' if @balance < amount
    {
      date: date,
      amount: -amount,
      balance: @balance -= amount
    }
  end
end
