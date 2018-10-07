class Plane
  attr_accessor :location
  
  AIRBORN = :airborn
  DEFAULT_LOCATION = AIRBORN

  NOT_AIRBORN = 'Plane is not airborn'
  IS_AIRBORN = 'Plane is airborn'

  def initialize(location = DEFAULT_LOCATION)
    @location = location
  end

end
