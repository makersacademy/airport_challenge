
class Weather
    
  attr_reader :today
    
  def initialize
    @today = nil
  end

  def generate
    if rand(6).zero?
      @today = "Stormy"
    else
      @today = "Sunny"
    end
  end
end
