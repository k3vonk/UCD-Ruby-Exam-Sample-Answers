class Population
  def initialize
    @tax_payers = []
  end

  def add(payer)
    @tax_payers << payer
  end

  def population_tax_due
    @tax_payers.inject(0.0) {|due, tax_payer| due + tax_payer.total_tax_due}
  end

  def population_percentage_not_paying
    counter = 0
    @tax_payers.each do |tax_payer|
      if tax_payer.total_tax_due == 0.0
        counter += 1.0
      end
    end

    (counter/@tax_payers.length) * 100
  end

  def sort!
    @tax_payers.sort!
  end

  def to_s
    s = "Total Tax Due per Person:\n"
    sort!
    s += @tax_payers.inject(s) {|str, tax_payer| str += tax_payer.to_s + "\n"}

    s += "Total Amount of Tax Due for Population: #{population_tax_due}\n"

    s += "Percentage Not Paying Tax: #{population_percentage_not_paying.round(0)}%"
  end
end