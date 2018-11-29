class Account
  def initialize(id, balance)
    @id = id
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    if @balance < amount
      puts "Unable to withdraw, low balance warning"
    else
      @balance -= amount
    end
  end

  def to_s
    "#{@id}: #{@balance}"
  end
end