

class Weather
  attr_reader :condition
  
  def stormy?
    true
  end

  def set
    @condition = rand(2)
  end
end
