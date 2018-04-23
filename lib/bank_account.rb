require 'date'
require_relative 'statement'

class BankAccount
  attr_accessor :balance, :date, :history

  def initialize
    @balance = 0
    @history = []
  end

  def deposit(amount)
    @history << {
      date: @date,
      credit: amount.to_f,
      balance: (@balance += amount).to_f
    }
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
  def get_date
    DateTime.now.strftime("%d/%m/%Y")
  end

end
