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
    la_x = Airport.new
    la_x.local_weather = "sunny"
    la_x.land_plane(subject)
    la_x.take_off(subject)
    expect(subject.landed). to eq false
  end
  it "changes @landed to true when it lands" do 
    la_x = Airport.new
    la_x.local_weather = "sunny"
    la_x.land_plane(subject)
    expect(subject.landed).to eq true
  end
  it "can't take off when it is already in the air" do
    luton = Airport.new
    luton.local_weather = "sunny"
    luton.land_plane(subject)
    luton.take_off(subject)
    expect { luton.take_off(subject) }.to raise_error "plane is already flying..."
  end
  it "doesnt raise an error when the plane isn't already flying" do 
    luton = Airport.new
    luton.local_weather = "sunny"
    luton.land_plane(subject)
    expect { luton.take_off(subject) }.not_to raise_error 
  end
end
