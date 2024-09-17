require_relative './plane'
class Airport
  attr_accessor :default_airport_capacity
  def initialize
    storage = []
    @storage = storage
    @default_airport_capacity = 4
  end 

  def land(plane, n)
    weather = ["Sunny", "Stormy", "Rainy", "Cloudy"]
    if weather[n-1] == "Stormy"
      return "Stormy weather, cannot land"
    else
      @storage << plane
    end

  end

  def depart(plane, n)
    weather = ["Sunny", "Stormy", "Rainy", "Cloudy"]
    if weather[n-1] == "Stormy"
      return "Stormy weather, cannot depart"
    else
      @storage.delete(plane)
      return @storage
    end
  end

  def max_capacity

    if @storage.length < @default_airport_capacity
      "Airport not full"
    else
      "Airport full"
    end
  end

  def grounded_planes
    @storage
  end

  def overide
    puts "what is the airport capacity?"
    capacity_input = gets.chomp.to_i
    @default_airport_capacity = capacity_input
  end
end
