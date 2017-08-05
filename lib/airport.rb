
class Airport

  attr_reader :capacity
  attr_accessor :planes

  def initialize cap = 5
    
    # sets default capacity,
    @capacity = cap

    # initializes an empty planes array
    @planes = []
  end

  def on_take_off plane

    # removes a plane from the planes array
    @planes.delete plane
    show_count

  end

  def on_land plane

    # adds a plane to the planes array
    @planes << plane
    show_count
  end

  def full?
    # returns true if capacity is reached
    return @planes.length >= @capacity
  end

  private

  def show_count
    # displays a message containing the number of grounded planes
    puts "airport now has #{@planes.length} planes"
  end

end
