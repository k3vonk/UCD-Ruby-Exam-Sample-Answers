class Transactions
  def initialize(id, amt)
    @id = id
    @amt = amt
  end

  def deposit_or_withdraw(bank)
    if @amt > 0
      bank.deposit(@id,@amt)
    else
      bank.withdraw(@id,@amt.abs)
    end
  end
end