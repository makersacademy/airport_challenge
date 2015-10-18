# require 'capybara/rspec'
#
# # Given 10 planes, each plane must land.
# # When weather conditions are stormy, pilot should try again later.
# # All planes are landed when they have status :landed
# # After all planes have landed, they should all take off again.
# # All planes have taken off when they have status :flying
#
# feature 'mega busy airport' do
#   scenario 'all planes will land despite averse weather' do
#     airport = Airport.new
#     planes =
#     10.times do
#       plane = Plane.new
#       begin
#         airport.clear_for_landing plane
#       rescue
#         airport.clear_for_landing plane
#       end
#       expect(plane.status).to eq :landed
#     end
#     expect(airport.planes.length).to eq 10
#   end
# end
