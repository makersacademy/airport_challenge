class Weather
  
  def initialize
    @storm_outcome = storm_today?
  end

  def stormy?
    @storm_outcome
  end
  
  private

  def storm_today?
    num = rand(100)
    return true if num == 1
    false
  end
end