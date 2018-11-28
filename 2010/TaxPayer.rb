
# Sample solution to the COMP30070 practical exam, Winter 2010.

BASE_SALARY = 34000
BASE_TAX_RATE = 20
UPPER_TAX_RATE = 41

class TaxPayer
  include Comparable
  
  def initialize name, salary, tax_credit
    @name, @salary, @tax_credit = name, salary, tax_credit
  end
  
  def compute_tax
    tax_due = 0.0
    if @salary <= BASE_SALARY
      tax_due = @salary*BASE_TAX_RATE/100
    else
      tax_due = BASE_SALARY*BASE_TAX_RATE/100 + (@salary-BASE_SALARY)*UPPER_TAX_RATE/100
    end
    tax_due -= @tax_credit
    tax_due<0? 0 : tax_due
  end
  
  def <=> taxpayer
    compute_tax <=> taxpayer.compute_tax
  end
  
  def to_s
    "#{@name} is due to pay #{compute_tax} in taxes."
  end
end

class TaxExile < TaxPayer
  def compute_tax
    0
  end
end

class Population
  def initialize
    @taxpayers = []
  end
  
  def add taxpayer
    @taxpayers.push taxpayer
  end
  
  def sort!
    @taxpayers.sort!
  end
  
  def to_s
    @taxpayers.inject("") do |str, taxpayer|
      str += taxpayer.to_s + "\n"
    end
  end
  
  def total_tax
    @taxpayers.inject(0) do |total, taxpayer|
      total += taxpayer.compute_tax
    end
  end
  
  def zero_tax
    num_on_zero_tax = 0
    @taxpayers.each do |taxpayer|
      if taxpayer.compute_tax==0
        num_on_zero_tax += 1
      end
    end  
    ((num_on_zero_tax.to_f/@taxpayers.size)*100.0).to_i
  end
  
end

population = Population.new
IO.foreach('taxpayers.txt') do |line|
  data =  line.split # so data is an array of strings
  name = data[0]
  salary = data[1].to_f
  tax_credit = data[2].to_f
  if name == "Sean"
    t=TaxExile.new name, salary, tax_credit
  else
    t=TaxPayer.new name, salary, tax_credit
  end
  population.add t
end

population.sort!
puts population.to_s + "\n"
puts "total tax paid is #{population.total_tax}"
puts "percentage on zero tax is: #{population.zero_tax}%"