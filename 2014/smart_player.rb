
class SmartPlayer < Player


  def number_guess
    puts "Range is: #{@range[0]}..#{@range[1]}"

    if @range[0] == 1
      1 + rand(@range[1])
    else
      @range[0] + rand(@range[1] - @range[0] + 1)
    end
  end

  def condition(value)
    if @oracle.is_it?(value) == 1
      @range[0] = value + 1
      puts "#{@name} guessed #{value}"
    elsif @oracle.is_it?(value) == -1
      @range[1] = value - 1
      puts "#{@name} guessed #{value}"
    else
      puts "#{@name} guessed #{value} and won!"
    end
  end

end