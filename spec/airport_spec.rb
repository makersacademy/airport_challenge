require 'airport'

describe Airport do
  it { is_expected.to respond_to :full? }
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }

  it 'plane landed at airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes_at_airport).to include plane
  end

  it 'plane takes off and it is flying in the air' do
    plane = Plane.new
    subject.take_off(plane)
    expect(subject.in_the_air).to include plane
  end

  it 'can not land if airport is full' do
    airport = Airport.new
    plane = Plane.new
    Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
    plane2 = Plane.new
    expect { airport.land(plane2) }.to raise_error 'Airport is full'
  end

  # it 'is stormy weather' do
  #   plane = Plane.new
  #   weather = Weather.new
  #   expect(weather.stormy?).to eq true
  #   expect { subject.land(plane) }.to raise_error 'Plane cannot land due to storm'
  # end
end
