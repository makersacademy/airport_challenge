require "airport"
require "weather"

describe Airport do

  # it "responds to land" do
  #   expect(subject).to respond_to :land_plane
  # end

  it "lands a plane" do
    plane = Plane.new
    airport = Airport.new(double(:weather, stormy?: false))
    expect(airport.land_plane(plane)).to eq plane
  end

  it "allows a plane to takeoff and removes it from the airport" do
    plane = Plane.new
    airport = Airport.new(double(:weather, stormy?: false))
    airport.land_plane(plane)
    expect(airport.takeoff).to eq plane
  end

  it "stops plane taking off when it's too stormy" do
    plane = Plane.new
    airport = Airport.new(double(:weather, stormy?: true))
    airport.land_plane(plane)
    expect {airport.takeoff}.to raise_error "Weather is too stormy to takeoff"
  end
end

# context 'When it is stormy' do
#
#   describe Airport do
#
#     before do allow (subject.weather).to receive(:stormy?) {true}
#
#       it "stops a plane taking off if weather is stormy" do
#         plane = Plane.new
#         subject.land_plane(plane)
#         expect{ subject.takeoff(plane) }.to raise_error "The weather is too stormy for take off"
#       end
#     end
#   end
# end
