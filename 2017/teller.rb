class Teller

  attr_reader :total_minutes

  def initialize(name, no_minutes)
    @name = name
    @no_minutes = no_minutes
    @total_minutes = 0
    @no_of_transactions = 0
  end

  def single_transaction(bank, transaction)
    transaction.deposit_or_withdraw(bank)
    @total_minutes += @no_minutes
    @no_of_transactions += 1
  end

  def to_s
    "Teller #{@name} completed #{@no_of_transactions} transactions in #{@total_minutes} minutes"
  end
end