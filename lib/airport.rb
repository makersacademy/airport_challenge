
class Airport

  attr_reader :capacity
  attr_accessor :planes

  def initialize cap = 5
    @capacity = cap
    @planes = []
  end

  def on_take_off plane
    @planes.delete plane
    show_count
  end

  def on_land plane
    @planes << plane
    show_count
  end

  def full?
    return @planes.length >= @capacity
  end

  private  
  def show_count
    puts "airport now has #{@planes.length} planes"
  end

end
