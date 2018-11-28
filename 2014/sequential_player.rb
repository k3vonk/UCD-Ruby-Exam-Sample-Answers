class SequentialPlayer < SmartPlayer
  def number_guess
    puts "Range is: #{@range[0]}..#{@range[1]}"

    @range[0]
  end
end