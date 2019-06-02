require_relative './weather.rb'

class Plane

  attr_reader :at_airport
   def initialize
     @at_airport = false
   end

  def at_airport
    @at_airport = true
  end

  def not_at_airport?
    @at_airport = false
  end


end