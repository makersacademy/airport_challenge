class Plane

	def initialize 
		@state = :on_land
  end

	def land(airport)
		return true if landed == true
	end

	def landed?
	end

  def take_off
  	if flying?
  		return false
  	end
  end    

  def flying?
  	return @state == :in_air
  end

end