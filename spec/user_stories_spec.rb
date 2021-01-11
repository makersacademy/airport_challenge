require "plane"
require "airport"
require "weather"

describe Airport do
  context 'when not stormy' do
    before do
      allow(Airport.new).to receive(:stormy?).and_return false
    end

    # As an air traffic controller
    # So I can get passengers to a destination
    # I want to instruct a plane to land at an airport
    it 'instructs a plane to land' do
      expect(Airport.new).to respond_to(:land).with(1).argument
    end

    # As an air traffic controller
    # So I can get passengers on the way to their destination
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it { is_expected.to respond_to(:takeoff).with(1).argument }
    it 'should instruct a plane to take off' do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return false
      airport.land(plane)
      expect(airport.takeoff(plane)).to eq "#{plane} has left the Airport"
    end

    context 'when airport is full' do
        # As an air traffic controller
        # To ensure safety
        # I want to prevent landing when the airport is full
      it 'should raise error when airport full' do
        plane = Plane.new
        airport = Airport.new(1)
        airport.land(plane)
        expect { airport.land(plane) }.to raise_error "Airport is full"
      end
    end
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy
  it "should not allow takeoffs when weather is stormy" do
    airport = Airport.new
    allow(airport).to receive(:stormy?).and_return false
    airport.land(Plane.new)
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.takeoff(Plane.new) }.to raise_error "No take offs allowed due to bad weather"
  end
end
