class Weather
  
  def stormy?
    random > 7
  end
  
  private
  
  def random
    rand(1..10)
  end

end
