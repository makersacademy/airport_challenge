require './lib/airport'
require './lib/plane'

describe Airport do
  let(:plane) { Plane.new}
  let(:airport) {Airport.new}

  it "instructs a plane to land" do
    expect(airport).to  respond_to(:land).with(1).argument
  end

  it "instructs a plane to take off" do
    expect(airport.take_off).to eq "Taken Off"
  end

  it "raises an error when airport is full" do
    20.times{ airport.land(plane) }
    expect{ airport.land plane }.to raise_error "This airport is full"
  end


end