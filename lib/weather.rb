
class Weather 
  attr_reader :sky

  def initialize 
    sky = stormy?
  end
  

  def stormy?
    roll = rand(1..100)
    roll >= 95
  end

end
