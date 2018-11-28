require_relative 'population.rb'
require_relative 'tax_payer.rb'
require_relative 'tax_exile.rb'

population = Population.new
begin
  IO.foreach('taxpayers.txt') do |line|
    data = line.split
    if data[0] == 'Sean'
      population.add(TaxExile.new(data[0],data[1].to_f, data[2].to_f))
    else
      population.add(TaxPayer.new(data[0],data[1].to_f, data[2].to_f))
    end
  end

  puts population.to_s
end