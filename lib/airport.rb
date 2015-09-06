class Airport

attr_accessor :capacity, :aircraft_count

def initialize(limit=3)
  @capacity = limit
  @aircraft_count = []
end

def receive_plane(plane)
  fail 'Airport at full capacity' if full?
  fail 'There is a storm!' if weather == "stormy"
    aircraft_count << plane
end

def release_plane
  fail 'No aircraft available' if empty?
  fail 'There is a storm!' if weather == "stormy"
  aircraft_count.pop
end

def weather
  rand(100) > 50 ? "sunny" : "stormy"
end

private

def full?
  aircraft_count.size >= capacity
end

def empty? 
  aircraft_count.empty?
end

end