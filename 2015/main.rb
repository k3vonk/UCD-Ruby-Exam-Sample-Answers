#Student Name: Ga Jun Young
#Student Number: 16440714

class Main
end

###################################################################
class Agency
  def initialize
    @males = []
    @females = []
  end

  def add_male(name, proficiency, desired_proficiency)
    @males << Player.new(name, proficiency, desired_proficiency)
  end

  def add_female(name, proficiency, desired_proficiency)
    @females << Player.new(name, proficiency, desired_proficiency)
  end

  def sort_players
    @males = @males.sort_by {|player| player.proficiency}
    @females = @females.sort_by {|player| player.proficiency}
  end

  def create_teams
    @teams = []
    sort_players
    @males.length.times {|i| @teams << Team.new(@males[i], @females[i])}
    @teams.each {|team| team.calc_satisfaction}
  end

  def each_player
    @males.each {|player| yield player}
    @females.each{|player| yield player}
  end

  def fitness
    @teams.each {|team| team.calc_satisfaction}
    @teams.inject(0) {|fitness, team|  fitness += team.satisfaction}
  end

  def steepest_ascent_hill
    i = 1
    best_curr_fitness = fitness
    best_curr_teams = @teams.map{|team| team.dup}

    @teams.length.times do |t|
      @teams.length-1.times do
        @teams[i%@teams.length].male, @teams[t].male = @teams[t].male, @teams[i%@teams.length].male

        if fitness > best_curr_fitness
          best_curr_fitness = fitness
          best_curr_teams = @teams.map{|team| team.dup}
        end

        @teams[t].male, @teams[i%@teams.length].male = @teams[i%@teams.length].male, @teams[t].male
        i += 1
      end

      @teams = best_curr_teams.map{|team| team.dup}
      i += 3
    end

    @teams = best_curr_teams

  end

  def to_s
    s = "MALE Players:\n"
    s += @males.inject("") {|str, player| str += "#{player.name}, proficiency: #{player.proficiency}, seeks proficiency >= #{player.desired_proficiency}.\n"}

    s += "\nFEMALE Players:\n"
    @females.inject(s) {|str, player| str += "#{player.name}, proficiency: #{player.proficiency}, seeks proficiency >= #{player.desired_proficiency}.\n"}
  end

  def team_to_s
    s = "\nTeam Satisfaction:"
    @teams.inject(s) {|str, team| str += "\n(#{team.female.name}, #{team.male.name}) Satisfaction: #{team.satisfaction}"}
  end
end

###################################################################
class Player
  attr_reader :name, :proficiency, :desired_proficiency

  def initialize(name, proficiency, desired_proficiency)
    @name = name
    @proficiency = proficiency
    @desired_proficiency = desired_proficiency
  end
end

###################################################################
class Team

  attr_reader :female, :satisfaction
  attr_accessor :male

  def initialize(male, female)
    @male = male
    @female = female
  end

  def calc_satisfaction
    @satisfaction = 0.0

    if @male.proficiency <= @female.desired_proficiency || @female.proficiency <= @male.proficiency
      if @male.proficiency < @female.desired_proficiency
        @satisfaction += -(@male.proficiency - @female.desired_proficiency).abs
      end

      if @female.proficiency < @male.desired_proficiency
        @satisfaction += -(@female.proficiency - @male.desired_proficiency).abs
      end

      @satisfaction = @satisfaction/2.00

    end
  end
end

###################################################################

mdt = Agency.new
File.open("men.txt", "r").each do |line|
    fields = line.split(" ")
    mdt.add_male(fields[0], fields[1].to_i, fields[2].to_i)
end

File.open("women.txt", "r").each do |line|
  fields = line.split(" ")
  mdt.add_female(fields[0], fields[1].to_i, fields[2].to_i)
end

# QUESTION 1 #
puts mdt.to_s

# QUESTION 2 #
mdt.create_teams
puts "\nSatisfaction of Team: " + mdt.team_to_s

# QUESTION 3 #
puts "\nName of the Elite:"
mdt.each_player {|player| if player.proficiency >= 9; puts player.name end}

#QUESTION 4 #
mdt.steepest_ascent_hill
puts mdt.team_to_s