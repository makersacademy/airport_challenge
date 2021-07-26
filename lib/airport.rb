require_relative "plane"

class Airport
  attr_accessor :hangar , :hangar_capacity, :weather_is_stormy

  def initialize(weather_is_stormy = is_stormy?, hangar_capacity = 20)
    @weather_is_stormy =  weather_is_stormy
    @hangar_capacity = hangar_capacity
    @hangar = []
  end  

  def land (plane)
    if @weather_is_stormy
      fail "Cannot land, weather is stormy"
    else  
      fail "Cannot land, Airport is full" if full?
      @hangar.push(plane)
    end  
  end

  def take_off
    if @weather_is_stormy
      fail "Cannot take off, weather is stormy"
    else
      fail "Cannot take off, there are no planes in the hangar" if empty?
      @hangar.pop
    end
  end
  
  def in_airport?(plane)
    if @hangar.include? plane
      p "#{plane} is in the hangar!"
      true
    else
      p "#{plane} is not in the hangar!"
      false
    end  
  end 

  def is_stormy?
    weather_number = rand(1..10)
    weather_number > 8 ? true : false
  end  

  private

  def full?
    @hangar.length == @hangar_capacity
  end  

  def empty?
    @hangar.length == 0
  end  
end  