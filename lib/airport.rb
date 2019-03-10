require "./lib/plane.rb"

class Airport

def initialize(name, capacity = 5)
end

attr_accessor :to, :from, :location, :weather, :name, :capacity

it "prevents landing when weather is stormy" do
#   plane = Plane.new
#   plane.take_off("BA555", "Heathrow", "Kinshasa")
# expect(plane.location).to eq("In the air")
end

def weather
end

def accept_plane?
  weather = [1, 2, 3, 4, 5].sample
  if weather == 1
    true
  else false
  end
end
end
