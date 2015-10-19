require 'airport'

describe Airport do

  it { is_expected.to respond_to(:full?) }

  it { is_expected.to respond_to(:planes) }

  it { is_expected.to respond_to(:capacity) }

  it { is_expected.to respond_to(:location) }

  it { is_expected.to respond_to(:stormy?) }


  it 'creates a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'lets us over-ride the default capacity' do
    airport = Airport.new(20)
    expect(airport.capacity).to eq(20)
  end

  context 'when a plane has taken off from an airport' do
      it 'is no longer in that airport' do
        plane = Plane.new
        plane.land(subject)
        plane.take_off(subject)
        expect(subject.planes).not_to include(plane)
      end
  end



end
