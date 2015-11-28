class Weather

  def report
    @conditions
  end

  def forecast
    atmosphere < 9 ? @conditions = 'sunny' : @conditions = 'stormy'
  end

  def atmosphere
    rand(10)
  end
end
