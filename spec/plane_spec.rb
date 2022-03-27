require './lib/plane'
require './lib/airport'

describe Plane do

  before(:each) do
    @plane = Plane.new
    @airport = Airport.new
    @weather = Weather.new
  end

  it "lands at the designated airport when instructed if airport is not full" do
    @plane.land(@airport)
    expect(@airport.hangar).to include(@plane)
    expect(@plane.land(@airport)).to eq @plane
  end

  it "will not land at airport that is full" do
    @airport.capacity.times { Plane.new.land(@airport) }
    expect { @plane.land(@airport) }.to raise_error("Airport full")
  end

  it "takes off when instructed if at an airport when weather is not stormy" do
    allow(@weather).to receive(:stormy?).and_return(false)
    @plane.land(@airport)
    expect(@plane.take_off).to eq @plane
    expect(@airport.hangar).not_to include(@plane)
    expect(@plane.location).to eq :in_air
  end

  it "lets air traffic controller know it can't take off if instructed to do so but not at airport" do
    expect { @plane.take_off }.to raise_error("Already in the air")
  end

  it "prevents take-off when weather is stormy" do
    @plane.land(@airport)
    allow(@weather).to receive(:stormy?).and_return(true)
    expect { @plane.take_off }.to raise_error("Stormy weather")
  end

end
