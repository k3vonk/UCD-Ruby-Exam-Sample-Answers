require 'test/unit'
require_relative '../TaxPayer.rb'


class TestTaxPayers < Test::Unit::TestCase
  def setup
    @player = TaxExile.new('Gerry', 65, 10)
  end

  def test_everything
    assert_equal( 0, @player.compute_tax, "Incorrect Value")
  end
end