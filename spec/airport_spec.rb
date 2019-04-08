require 'airport'
describe Airport do
  it "lands planes" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land_plane(plane)).to eq plane
  end
  
  it "allows plane to take off" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.plane_take_off(plane)).to eq "Plane left the airport"
  end

  it "prevents plane from taking off if weather is stormy" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.prevent_take_off_if_stormy(plane)).to eq plane
  end

  it "prevents landing if weather is stormy" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.prevent_landing_if_stormy(plane)).to eq "Plane cannot land due to story weather"
  end
  
  it "set airport default value" do
    expect(subject.capacity).to eq 1
  end

  it "changes default capacity" do
    airport = Airport.new(2)
    expect(airport.capacity).to eq 2
  end
  
  it 'raises an error when full' do
    airport = Airport.new(0)
    expect { airport.prevent_landing_if_airport_is_full }.to raise_error 'Airport full'
  end
end
