class Airport

	DEFAULT_HANGAR_CAPACITY = 5

	attr_reader :capacity

	def initialize(capacity = DEFAULT_HANGAR_CAPACITY)
		@hangar = []
		@capacity = capacity
    end

	def allow_landing(plane)
		fail "The hangar is full, landing denied!" if @hangar.length >= capacity
		fail "It is too dangerous to land due to weather conditions!" if stormy?
        plane.land
		@hangar << plane
	end

	def allow_take_off
		fail ("The hangar is empty!!") if @hangar.empty?
		fail "It is too dangerous to take off due to weather conditions!" if stormy?
		plane = @hangar.pop
		plane.take_off
		plane
	end

	private

	def stormy?
		rand(10) > 8 ? true : false
	end


end