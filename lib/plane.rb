class Plane
  attr_accessor :whereabouts
  
  def initialize
    @whereabouts = :flying
  end

  def log_airport(airport_id)
    @whereabouts = airport_id
  end

  def change_status_to_flying
    @whereabout = :flying
  end
end
