require './lib/airport.rb'
require './lib/plane.rb'

airport = Airport.new

describe Airport do
  it { expect(Airport.new).to respond_to(:land) }
end

describe 'land method' do
  it "Check if the method lands a Plane" do
  expect(airport.hangar[0]).to be_instance_of(Plane)
 end
end
# describe "Testing to dock a bike" do
#   station = DockingStation.new
#   bike = station.release_bike
#   station.dock(bike)
#   it "Adds a bike to a docking station" do
#     expect(station.available.length).to eq(1)
#   end
# end
