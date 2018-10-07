require_relative 'airport.rb'

class Weather
  def conditions
    rand() < 0.8 ? "Clear" : "Storm"
  end
end
