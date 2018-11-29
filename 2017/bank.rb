class Bank

  attr_reader :accounts
  include Enumerable

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

  def each
    @accounts.each do |id, account|
      yield account
    end
  end

  def to_s
    str = ""
    @accounts.each do |id, account|
      str += account.to_s + "\n"
    end
    str
  end
end