load 'Plane.rb'

class Airport
  attr_accessor :weather
  attr_accessor :capacity
  attr_accessor :planes

  def initialize (capacity = 10)
    random_variable = rand(0..1)
    random_variable == 1 ? @weather = 'stormy' : @weather = 'clear'
    @capacity = capacity
    @planes = []
  end

  def is_full? 
    planes.count == capacity ? true : false
  end

end



# -- Debugging puts statements -- #

# heathrow = Airport.new
# heathrow.planes = ['easyjet', '777']
# puts heathrow.planes

heathrow = Airport.new(12)
puts heathrow.capacity
puts heathrow.planes 
10.times { heathrow.planes << Plane.new('test_plane') }
puts heathrow.planes