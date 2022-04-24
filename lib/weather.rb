
class Weather

  def stormy?
    forecast >= 6
  end

  private
  
  def forecast
    rand(10)
  end
end
