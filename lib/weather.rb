class Weather
  attr_reader :stormy
  
  def stormy?
    @stormy = rand(2).zero?
  end
end
