class Plane
  attr_reader :whereabouts
  
  def initialize
    @whereabouts = :flying
  end

  def log_airport(airport_id)
    @whereabouts = airport_id
  end
end
