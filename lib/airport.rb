class Airport
    DEFAULT_CAPACITY = 10
    DEFAULT_STORM_PROBABILITY = 0.3
    attr_reader :name, :capacity, :storm_probability, :planes
    @@airports = []

    def self.airports
        @@airports
    end

    def initialize(capacity = DEFAULT_CAPACITY, storm_probability = DEFAULT_STORM_PROBABILITY)
        @name = auto_name
        @capacity = capacity
        @storm_probability = storm_probability
        @planes = []
        @@airports << self
        # @weather_time = Time.now - 61
        # check_storm
    end

    def land(plane)
        fail "#{@name} is full" if full?
        fail "#{plane.name} has already landed" if plane.status == "land"
        fail "weather is stormy" if stormy?
        plane.land(self)
        @planes << plane
        @capacity -= 1
    end

    def take_off(plane)
        fail "#{plane.name} not in airport" if plane.airport != self
        fail "weather is stormy" if stormy?
        plane.take_off
        @planes.delete(plane)
        @capacity += 1
    end

    def set_storm_probability(probability)
        fail "only accept probability between 0-1" if probability < 0 || probability >1
        # between 0 - 1
        @storm_probability = probability
    end

    # def check_storm
    #     if @weather_time + 60 < Time.now
    #         @stormy = rand(100) < @storm_probability * 100 ? true : false
    #         @weather_time = Time.now
    #     end
    #     @stormy
    # end

    private

    def full?
        @capacity <= 0
    end

    def stormy?
        rand(100) < @storm_probability * 100 ? true : false
    end

    def auto_name
        "Colony #{@@airports.count + 1}"
    end
end