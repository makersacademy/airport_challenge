class Airport
  attr_reader :planes
  
  AIRPORT_CAPACITY = 10
  
  def initialize(plane)
    @planes = []
    5.times { @planes << plane.new }
  end
  
  def receive_plane(plane)
    @planes << plane
  end
  
  def release_plane(plane)
    @planes.delete plane
  end
  
  def ready_for_landing?
    check_weather == :sunny and not full?
  end
  
  def ready_for_taking_off?
    check_weather == :sunny
  end
  
  private
  
    def check_weather
      rand(1..10) > 7 ? :stormy : :sunny
    end
    
    def full?
      @planes.count == AIRPORT_CAPACITY 
    end
end
