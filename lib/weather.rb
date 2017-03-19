class Weather

  def forecast
    number = Random.new.rand(1..10)
    number == 1 ? :stormy : :fine
  end

end
