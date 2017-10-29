require 'plane'
require 'airport'

describe Plane do

  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }
  it "Should land at an airport" do
    airport = Airport.new
    subject.land(airport)
    expect(airport.landed_planes[-1]).to eq subject
  end

  it "Should take off from an aiport" do
    airport = Airport.new
    5.times { subject.land(airport) }
    subject.take_off(airport)
    expect(airport.landed_planes.length).to eq 4
  end

  it "Should return an error if a plane tries to take off but there are no planes at the airport" do
    airport = Airport.new
    expect { subject.take_off(airport) }.to raise_error("There are no planes in the airport to take off")
  end


  it "Planes should not be allowed to take off if the weather is stormy" do
    airport = Airport.new
    5.times { subject.land(airport) }
    subject.take_off(airport)
    expect { subject.take_off(airport) }.to raise_error("The weather is stormy! No planes can take off at the moment.")
  end

end
