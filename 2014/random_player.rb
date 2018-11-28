class RandomPlayer < Player

  def number_guess
    1 + rand(@range[1])
  end

  def condition(value)
    if @oracle.is_it?(value) == 0
      puts "#{@name} guessed #{value} and won!"
    else
      puts "#{@name} guessed #{value}"
    end
  end


end