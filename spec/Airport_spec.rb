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

  it "is not possible to land when airport is full" do
    100.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error "ATTENTION - It is not possibile to land because the airport is full!"
  end
end
