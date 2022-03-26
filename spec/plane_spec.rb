require './lib/plane'
require './lib/airport'

describe Plane do

  before(:each) do
    @plane = Plane.new
    @airport = Airport.new
  end

  it "lands at the designated airport when instructed" do
    @plane.land(@airport)
    expect(@airport.hangar).to include(@plane)
    expect(@plane.land(@airport)).to eq @plane
  end

  it "takes off when instructed if at an airport" do
    @plane.land(@airport)
    expect(@plane.take_off).to eq @plane
    expect(@airport.hangar).not_to include(@plane)
    expect(@plane.location).to eq :in_air
  end

  it "lets air traffic controller know it can't take off if instructed to do so but not at airport" do
    expect { @plane.take_off }.to raise_error("Already in the air")
  end

end
