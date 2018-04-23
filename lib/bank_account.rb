require 'date'

class BankAccount
  attr_reader :balance, :date

  def initialize(balance = 0)
    @date = get_date
    @credit = 0
    @debit = 0
    @balance = balance
  end

  def deposit(amount)
    {
      @date => {
        credit: amount.to_f,
        debit: @debit.to_f,
        balance: (@balance += amount).to_f
      }
    }
  end

  def withdrawal(amount)
    raise 'Sorry, your balance is too low.' if @balance < amount
    {
      @date => {
        credit: @credit.to_f,
        debit: amount.to_f,
        balance: (@balance -= amount).to_f
      }
    }
  end

  private
  def get_date
    DateTime.now.strftime("%d/%m/%Y").to_sym
  end

end
