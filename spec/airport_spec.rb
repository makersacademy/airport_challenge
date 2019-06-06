require 'airport'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) {double :plane}

  it 'intructs a plane to land at airport' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it 'so planes take off from airport, instruct a plane to take_off' do
    airport = Airport.new(20)
    expect(airport).to respond_to(:take_off)
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full
  context 'when full' do
    it 'raises an error' do
      airport = Airport.new(20)
      plane = Plane.new
      20.times do # land all planes to fill up capacity
        airport.land(plane)
      end
      expect { airport.land(plane) }.to raise_error "Cannot land plane airport full."
    end
  end
end
