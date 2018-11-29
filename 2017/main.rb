require_relative 'bank.rb'
require_relative 'account.rb'
require_relative 'transactions.rb'


############## PART 1 ############
bank = Bank.new
bank.add_account(10)
bank.add_account(20)
bank.add_account(30)

bank.deposit(10, 23)
bank.deposit(20, 30)
bank.deposit(30, 40)

puts bank.to_s

############# PART 2 ##############

bank2 = Bank.new
begin
  IO.foreach('accounts.txt') do |line|
    bank2.add_account(line.to_i)
  end
end

transactions = []
begin
  IO.foreach('transactions.txt') do |line|
    data = line.split
    transactions << Transactions.new(data[0].to_i, data[1].to_f)
  end
end

transactions.each do |transaction|
  transaction.deposit_or_withdraw(bank2)
end

puts bank2.to_s

largest = 0
bank2.each{|account| if account.balance > largest; largest = account.balance end}
puts "max account balance in bank is: $#{largest.round(2)}"

total = 0
bank2.each{|account| total += account.balance}
puts "average account balance in bank is: $#{(total/bank2.accounts.length).round(2)}"

puts "total balance in bank is: $#{total.round(2)}"

