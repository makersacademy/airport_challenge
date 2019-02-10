require_relative 'airport'

class Weather
  SUNNY = 1
  STORMY = 2

  def forecast
    rand(SUNNY, STORMY)
  end

  # def stormy?
  #   forecast == 2
  # end

end
