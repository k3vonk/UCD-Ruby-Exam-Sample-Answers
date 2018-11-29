require 'test/unit'
require_relative '../tax_payer.rb'


class TestTaxPayers < Test::Unit::TestCase
  def setup
    @player = TaxPayer.new('Gerry', 65, 10)
  end

  def test_total_tax_due
    assert_equal( 3, @player.total_tax_due, "Incorrect Value")
  end

  def test_to_s
    assert_equal("Gerry 3.0", @player.to_s, "String is not showing the correct information")
  end
end