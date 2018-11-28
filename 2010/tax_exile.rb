require_relative 'tax_payer.rb'

class TaxExile < TaxPayer
  def total_tax_due
    0.0
  end
end