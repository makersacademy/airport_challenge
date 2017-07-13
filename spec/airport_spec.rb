require 'airport'
require 'plane'


describe Airport do
  subject(:airport) { described_class.new}
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  it "confirms that a plane is taking off" do
    allow(aiport).to receive(:stormy?) { false }
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).to eq []
  end

  it "confirms that a plane has landed" do
    p allow(weather).to receive(:stormy?) { false }
    airport.land(plane)
    expect(airport.planes).to eq [plane]
  end

  it "raises an error if airport is full" do
    allow(weather).to receive(:stormy?) { false }
    20.times { airport.land(plane) }
    expect {airport.land(plane)}.to raise_error "Airport full!"
  end

  it "raises an error if the weather is stormy for take off" do
    airport.land(plane)
    allow(weather).to receive(:stormy?) { true }
    expect {airport.take_off(plane)}.to raise_error "Too stormy to take off today."
  end

  it "raises an error if the weather is stormy for landing" do
    allow(weather).to receive(:stormy?) { true }
    expect {airport.land(plane)}.to raise_error "Too stormy to landing today."
  end
end
