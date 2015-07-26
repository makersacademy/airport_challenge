class Airport

	attr_reader :planes, :traffic_controller, :weather, :capacity

	def initialize 
		@planes = []
		@traffic_controller = TrafficController.new(self)
		@weather = "Glorious Sunshine"
		@capacity = 5
	end

	def receive_plane(plane) 
		@planes << plane
		return
	end

	def full?
		true if @planes.count == @capacity
	end

end
