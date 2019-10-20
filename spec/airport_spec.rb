require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject(:airport) { described_class.new(20) }
  it "lands a plane at an airport" do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it "allows a plane to take off, and to confirm it's not in the airport" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

#  As an air traffic controller, to ensure safety
#  I want to prevent take_off when weather is stormy

# context "preventing take-off in stormy weather" do
#    it "states the plane can't leave due to storms" do
#      expect(subject.take_off).to eq "Can't take off during storms."
#    end
#  end

# As an air traffic controller, To ensure safety
# I want to prevent landing when the airport is full
  it 'does not allow planes to land when the airport is full' do
    plane = double :plane
    20.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full"
  end

end
