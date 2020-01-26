
require_relative 'weather'

class Airport

    DEFAULT_CAPACITY = 2
   
    attr_accessor :capacity
    
    def initialize(capacity=DEFAULT_CAPACITY)
        @terminal = []
        @capacity = capacity
    end

    def land(plane)
       fail "No space to land" if full?
       terminal << plane
    end 

    def take_off(plane, weather)
      fail "weather is stormy, unable to take off" if weather.stormy?
      terminal.pop
    end 

    private
    attr_reader :terminal

    def full?
        terminal.count >= DEFAULT_CAPACITY
    end 

    # def empty?
    #     terminal.empty?
    # end
end 