class Airport
	 DEFAULT_CAPACITY = 100
	 attr_reader :capacity, :planes

	 def initialize(capacity = DEFAULT_CAPACITY)
		  @capacity = capacity
		  @planes = []
	 end
	 
	 def land plane
		fail 'Airport is full!' if full?
		@planes << plane
	 end

	#  def depart plane
	# 	@planes -= plane if @planes.include? plane
	#  end
	private
	
	def full?
		@planes.count >= capacity
	end

end
