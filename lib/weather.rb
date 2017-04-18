require_relative 'airport'


class Weather
  attr_reader :condition

  def initialize(airport)
    rand(1..10) >= 9 ? @condition = "Stormy" : @condition = "Sunny"
    joke(airport)
  end

  private

  def joke(airport)
    @condition = "Always Sunny" if airport.name == "Philadelphia"
  end
end
