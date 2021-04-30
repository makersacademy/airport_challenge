require 'airport'

describe Airport do
  subject(:airport) { described_class.new(10) }

  it "Expects a plane to land" do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it "Instructs a plane to take_off" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it "Does not allow a plane to land when airport is at capacity" do
    plane = double :plane
    10.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error "Plane cannot land at a full airport!"
  end

end
