# require 'airport'
# require 'plane'

# describe Airport do
#   context 'two airports are created, 5 planes in each.  All planes from one airport fly to the other' do
#     airport1 = Airport.new("London Heathrow", 10)
#     airport2 = Airport.new("Manchester", 10)
#     planes1 = Hash.new
#     planes2 = Hash.new
#     5.times {|x| planes1["plane#{x}"] = Plane.new }
#     5.times {|x| planes2["plane#{x}"] = Plane.new }
#     planes1.each {|key, value| airport.add_new_planes[key]}
#   end
# end