require 'airport'

describe Airport do

  let(:plane) { double('plane')}

  it 'lands a plane on command' do
    subject.land(plane)
    expect(subject.planes.last).to eq plane
  end

  it 'takes-off a plane on command' do
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes.include?(plane)).to eq false
  end

  it 'refuses to land a plane if the default capacity is reached' do
    Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error 'Airport full.'
  end

  it 'allows capacity to be modified and reports when full accordingly' do
    new_capacity = (Airport::DEFAULT_CAPACITY + 2)
    subject.set_capacity(new_capacity)
    new_capacity.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error 'Airport full.'
  end

  it 'refuses to allow a plane to take off it is in a different airport' do
    second_airport = Airport.new
    subject.land(plane)
    expect { second_airport.take_off(plane) }
        .to raise_error 'Plane not at airport.'
  end


end
