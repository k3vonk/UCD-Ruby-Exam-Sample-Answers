class Bank
  def initialize
    @accounts = {}
  end

  def add_account(id)
    @accounts[id] = Account.new(id, 0.0)
  end

  def deposit(id, amt)
    @accounts[id].deposit(amt)
  end

  def withdraw(id, amt)
    @accounts[id].withdraw(amt)
  end

  def to_s
    @accounts.inject("") {|str, id, account| str + account.to_s + "\n"}
  end
end