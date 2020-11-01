require "airport"

describe Airport do
  let(:plane) { double :plane }
  subject(:airport) { described_class.new(100) }

  it "instructs a plane to land at an airport" do
    expect(airport).to respond_to(:land)
  end

  it "instructs a plane to take off from an airport" do
    expect(airport).to respond_to(:take_off)
  end

  it "raises an error when airport is full" do
    allow(airport).to receive(:stormy?).and_return false
    100.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error "ATTENTION - It is not possibile to land because the airport is full!"
  end

  it "has default capacity that equals 100" do
		expect(subject.capacity).to eq 100
	end

  it "raises an error if requested to takeoff when weather is stormy" do
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.take_off(plane) }.to raise_error "ATTENTION - It is not possible to take off because of weather condition!"
  end

  it "raises an error if requested to land when weather is stormy" do
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.land(plane) }.to raise_error "ATTENTION - It is not possible to land because of weather condition!"
  end

  it "raise an error if plane is not in this airport" do
    allow(airport).to receive(:stormy?).and_return false
    airport2 = described_class.new(100)
    airport2.land(plane)
    expect { airport.take_off(plane) }.to raise_error "ERROR - Plane is not in this airport."
  end
end
