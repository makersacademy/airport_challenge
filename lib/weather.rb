class Weather
  def forecast
    atm_pressure < 930 ? :stormy : :standard
  end

  private
  def atm_pressure
    rand(900..1000)
  end
end
