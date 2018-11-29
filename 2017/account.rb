class Account

  attr_reader :balance

  def initialize(id, balance)
    @id = id
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def to_s
    "Account #{@id} contains $#{@balance.round(2)}"
  end
end