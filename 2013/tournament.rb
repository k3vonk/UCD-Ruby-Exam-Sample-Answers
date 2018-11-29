class Tournament

  def initialize
    @players = []
  end

  def add_player player
    @players << player
  end

  def average_rating
    total = @players.inject(0) {|t, player| t += player.rating}
    total/@players.length
  end

  def sort!
    @players.sort! {|x,y| y.total_score <=> x.total_score}
  end

  def total_win
    @players.inject(0){|win, player| win += player.total_score}
  end

  def total_lose
    total = @players.inject(0){|lose,player| lose += player.results.length}
    total - total_win
  end

  def rounds_equal_players?
    @players.each do |player|
      if player.results.length != @players.length - 1
        return false
      end
    end

    return true
  end

  def consistent?
    total_win == total_lose && rounds_equal_players?
  end

  def new_to_s
    @players.inject("") {|str, player| str += "#{player.name}'s new rating #{player.new_rating(@players).round(0)} \n"}
  end
  def to_s
    @players.inject("") {|str, player| str += player.to_s + "\n"}
  end
end