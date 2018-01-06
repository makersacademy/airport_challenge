
class Weather

  STORM = 0.8

  def initialize
    @storm_chance = rand
  end

  def stormy?
    @storm_chance > STORM
  end 
end
