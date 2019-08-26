class Airport
    attr_reader :planes
    attr_reader :capacity
    attr_reader :weather

    DEFAULT_CAPACITY = 100

    def initialize(capacity = DEFAULT_CAPACITY)
        @capacity = capacity
        @planes = []
        @weather = weather_reporter
    end

    def land(plane)
        fail 'Cannot land, weather stormy' if weather == "stormy"
        fail 'Cannot land, airport full' if @planes.size == @capacity

        @planes << plane
    end

    def take_off(plane)
        fail 'Cannot take off, weather stormy' if weather == "stormy"
        fail 'Plane not at airport' unless @planes.include?(plane)

        plane.report_taken_off
        @planes.delete(plane)
    end

    def weather_reporter
        @weather = Random.rand(11)
        @weather > 9 ? @weather = 'stormy' : @weather = 'sunny'
    end

end