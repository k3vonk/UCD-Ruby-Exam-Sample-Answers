class Bank

  attr_reader :accounts
  include Enumerable

  def initialize
    @accounts = {}
    @tellers = []
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

  def add_teller(teller)
    @tellers << teller
  end

  def process_transactions_randomly(transactions)
    transactions.each {|transaction| @tellers[rand(@tellers.length)].single_transaction(self, transaction)}
  end

  def teller_to_s
    @tellers.inject(""){|str, teller| str += teller.to_s + "\n"}
  end

  def to_s
    str = ""
    @accounts.each do |id, account|
      str += account.to_s + "\n"
    end
    str
  end
end