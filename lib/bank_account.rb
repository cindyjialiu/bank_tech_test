class BankAccount
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(amount)
    (@balance += amount).to_f
  end

  def withdrawal(amount)
    raise 'Sorry, your balance is too low.' if @balance < amount
    (@balance -= amount).to_f
  end

end
