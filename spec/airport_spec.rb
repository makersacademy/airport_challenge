require 'airport'

describe Airport do
  let(:airport) {Airport.new}
  let(:plane) { double :plane, flying?: true}
  let(:sunny) { double :sunny, sunny?: rand(21..100) }
  let(:stormy) { double :stormy, stormy?: rand(1..20) }
  
  it "can have a default capacity" do
    expect(airport.capacity).to eq 10
  end

  it "can allow a plane to dock" do
    airport.dock plane
    expect(airport.planes).to eq [plane]
  end

  it "can allow a plane to be released" do
    airport.dock plane
    airport.release(plane)
    expect(airport.planes).to eq []
  end

  it "can have sunny weather" do
    expect(airport).to be_sunny
  end

  it "can have stormy weather" do
    expect(airport).to be_stormy
  end

  it "knows when its full" do
    airport.capacity.times{ airport.dock plane }
    expect(airport).to be_full
  end

  it "knows when its not full" do
    expect(airport).not_to be_full
  end

  it "can not allow a plane to dock if full" do
    airport.capacity.times { airport.dock plane }
    expect {airport.dock plane}.to raise_error "Airport is full"
  end
end
