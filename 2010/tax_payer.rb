LOWER_TAX_RATE = 0.20
UPPER_TAX_RATE = 0.41
UPPER_LIMIT = 60000

class TaxPayer

  include Comparable

  def initialize(name, salary, tax_credit)
    @name = name
    @salary = salary
    @tax_credit = tax_credit
  end

  def lower_cut_off
    LOWER_TAX_RATE * @salary
  end

  def upper_cut_off
    UPPER_TAX_RATE * (UPPER_LIMIT - @salary)
  end

  def total_tax_due
    if @salary > UPPER_LIMIT
      total = lower_cut_off + upper_cut_off - @tax_credit
    else
      total = lower_cut_off - @tax_credit
    end

    if total < 0.0
      total = 0.0
    end

    total
  end

  def <=>(other)
    total_tax_due <=> other.total_tax_due
  end

  def to_s
    "#{@name} #{total_tax_due}"
  end
end