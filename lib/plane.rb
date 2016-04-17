class Plane

	def initialize 
		@state = :on_land
  end

	def land(airport)
		true if landed == true
	end

	def landed?
	end

  def take_off
  	if flying?
  		false
  	end
  	@state = :in_air
  end    

  def flying?
  	return @state == :in_air
  end

end