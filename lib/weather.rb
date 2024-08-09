class Weather 

  STORM_ODDS = 5
  ODDS_DENOMINATOR = 100

  def initialize(n = rand(ODDS_DENOMINATOR))
    @weather = n
  end

  def stormy?
    return true if weather <= STORM_ODDS
    return false
  end

  private
  
  attr_reader :weather

end
