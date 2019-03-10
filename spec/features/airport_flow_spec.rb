# RSpec.feature "Airport flow" do
#   scenario "User creates an airport and lands a new plane" do
#     airport_one = Airport.new
#     5.times airport_one.land(Plane.new)
#     expect(airport_one.plane_list.length).to eq 5
#   end
#
#   scenario "User creates an airport and lands/takes off a few planes" do
#     airport_one = Airport.new
#     allow(airport_one).to receive(:current_weather) { "Sunny" }
#     first_plane = Plane.new
#     second_plane = Plane.new
#     5.times airport_one.land(Plane.new)
#     airport_one.land(first_plane)
#     3.times airport_one.land(Plane.new)
#     airport_one.land(second_plane)
#
#     expect(airport_one.plane_list.length).to eq 10
#
#
#   end
# end
