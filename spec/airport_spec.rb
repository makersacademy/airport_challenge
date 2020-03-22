require 'airport'

describe Airport do

  it 'instructs plane to land and confirms landing if weather is clear' do
    allow_any_instance_of(Weather).to receive_messages(stormy?: false)
    plane = Plane.new
    expect(subject.land(plane)).to eq :landed
  end

  it 'instructs plane to land' do
    expect(subject).to respond_to :land
  end

  it 'instructs plane to take off and confirms take off if weather is clear' do
    allow_any_instance_of(Weather).to receive_messages(stormy?: false)
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq :flying
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
    subject.capacity = 100
    99.times { subject.land(Plane.new) }
    expect(subject.land(Plane.new)).to eq :landed
  end

  it 'prevents #land if airport is full at overriden capacity' do
    allow_any_instance_of(Weather).to receive_messages(stormy?: false)
    subject.capacity = 100
    100.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error 'Airport full'
  end

  it 'prevents #take_off if weather is stormy' do
    allow_any_instance_of(Weather).to receive_messages(stormy?: false)
    plane = Plane.new
    subject.land(plane)
    allow_any_instance_of(Weather).to receive_messages(stormy?: true)
    expect { subject.take_off(plane) }.to raise_error 'Weather stormy'
  end

  it 'prevents #land if weather is stormy' do
    allow_any_instance_of(Weather).to receive_messages(stormy?: true)
    expect { subject.land(Plane.new) }.to raise_error 'Weather stormy'
  end

  it 'Plane can only leave airport it is in' do
    allow_any_instance_of(Weather).to receive_messages(stormy?: false)
    expect { subject.take_off(Plane.new) }.to raise_error 'Plane not in airport'
  end

  it 'Plane is removed from the airport on #take_off' do
    allow_any_instance_of(Weather).to receive_messages(stormy?: false)
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect { subject.take_off(plane) }.to raise_error 'Plane not in airport'
  end

  it 'Removes the correct plane on #take_off' do
    allow_any_instance_of(Weather).to receive_messages(stormy?: false)
    plane = Plane.new
    plane1 = Plane.new
    subject.land(plane)
    subject.land(plane1)
    subject.take_off(plane)
    expect(subject.planes).to include plane1
  end

end
