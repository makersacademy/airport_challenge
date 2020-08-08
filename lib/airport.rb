require_relative 'plane'
class Airport
    attr_reader :planes
    attr_reader :capacity
    DEFAULT_CAPACITY = 50
    def initialize(capacity= DEFAULT_CAPACITY)
        @condition = self.condition
        p @condition
        @capacity = capacity
        @planes = []
    end
    def land(plane)
        fail 'airport is full' if full?
        @planes.push(plane)
        @planes[@planes.length - 1]
    end

    def take_off(condition= 'sunny')
        @condition = condition
        fail 'too stormy to take off' if @condition == 'stormy'
       @planes.pop()
    end

    def condition
        num = rand(4)
        if num == 0
          return 'stormy'
        else
         return 'sunny'
        end
     end

    private
    def full?
        if @planes.count >= DEFAULT_CAPACITY
            true
        end
    end
end