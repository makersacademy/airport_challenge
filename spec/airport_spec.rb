require 'airport'

describe Airport do

  it 'instructs plane to land and confirms landing if weather is clear' do
    allow_any_instance_of(Weather).to receive_messages(stormy?: false)
    plane = Plane.new
    expect(subject.land(plane)).to eq true
  end

  it 'instructs plane to land' do
    expect(subject).to respond_to :land
  end

  it 'instructs plane to take off and confirms take off if weather is clear' do
    allow_any_instance_of(Weather).to receive_messages(stormy?: false)
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq true
  end

  it 'instructs plane to #take_off' do
    expect(subject).to respond_to :take_off
  end

  it 'prevents #land if airport is full at DEFAULT_CAPACITY' do
    allow_any_instance_of(Weather).to receive_messages(stormy?: false)
    Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error 'Airport full'
  end

  it 'DEFAULT_CAPACITY can be overriden' do
    allow_any_instance_of(Weather).to receive_messages(stormy?: false)
    airport = Airport.new(100)
    99.times { airport.land(Plane.new) }
    expect(airport.land(Plane.new)).to eq true
  end

  it 'prevents #land if airport is full at overriden capacity' do
    allow_any_instance_of(Weather).to receive_messages(stormy?: false)
    airport = Airport.new(100)
    100.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error 'Airport full'
  end

  it 'prevents #take_off if weather is stormy' do
    allow_any_instance_of(Weather).to receive_messages(stormy?: true)
    expect { subject.take_off(Plane.new) }.to raise_error 'Weather stormy'
  end

  it 'prevents #land if weather is stormy' do
    allow_any_instance_of(Weather).to receive_messages(stormy?: true)
    expect { subject.land(Plane.new) }.to raise_error 'Weather stormy'
  end

  it 'Plane can only leave airport it is in' do
    allow_any_instance_of(Weather).to receive_messages(stormy?: false)
    expect { subject.take_off(Plane.new) }.to raise_error 'Plane not in airport'
  end

end
