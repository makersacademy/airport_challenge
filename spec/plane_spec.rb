require 'airport'
require 'plane'
describe Plane do

  it "can be landed at an airport" do
    heathrow = Airport.new
    heathrow.local_weather = "sunny"
    heathrow.land_plane(subject)
  end
  it "can take off from an airport" do 
    heathrow = Airport.new
    heathrow.local_weather = "sunny"
    heathrow.land_plane(subject)
    expect(heathrow.take_off). to eq subject 
  end
  it "can take off even when other planes have landed since" do
    gatwick = Airport.new
    gatwick.local_weather = "sunny"
    gatwick.land_plane(subject)
    gatwick.land_plane
    expect(gatwick.take_off(subject)).to eq subject
  end
  it "changes @landed to false when takes off" do
    laX = Airport.new
    laX.local_weather = "sunny"
    laX.land_plane(subject)
    laX.take_off(subject)
    expect(subject.landed). to eq false
  end
  it "changes @landed to true when it lands" do 
    laX = Airport.new
    laX.local_weather = "sunny"
    laX.land_plane(subject)
    expect(subject.landed).to eq true
  end
  it "can't take off when it is already in the air" do
    luton = Airport.new
    luton.local_weather = "sunny"
    luton.land_plane(subject)
    luton.take_off(subject)
    expect {luton.take_off(subject)}.to raise_error "plane is already flying..."
  end
end