require 'airport'

describe Airport do

  it 'can store the landed instance of a plane in the airport for counting' do
    instance_of_plane = Plane.new
    subject.stormy = false
    subject.land(instance_of_plane)
    expect(subject.planes_in_airport).to include(instance_of_plane)
  end

  it 'can remove the taken-off instance of a plane from the airport after takeoff' do
    instance_of_plane = Plane.new
    subject.stormy = false
    subject.land(instance_of_plane)
    subject.take_off(instance_of_plane)
    expect(subject.planes_in_airport).not_to include(instance_of_plane)
  end

  it 'checks that a plane cannot land twice in the same airport if already landed' do
    instance_of_plane = Plane.new
    subject.stormy = false
    subject.land(instance_of_plane)
    expect { subject.land(instance_of_plane) }.to raise_error('Plane already landed!')
  end

  it 'checks that a plane that has taken off cannot take off again from the same airport' do
    instance_of_plane = Plane.new
    expect { subject.take_off(instance_of_plane) }.to raise_error('Plane not in airport!')
  end

  it 'can check whether a defined airport instance is full and can no longer accept planes' do
    fullairport = described_class.new
    fullairport.stormy = false
    fullairport.capacity.times { fullairport.land(Plane.new) }
    expect { fullairport.land(Plane.new) }.to raise_error('Airport is full!')
  end

  it 'checks that a plane in the air cannot land if the weather is stormy' do
    instance_of_plane = Plane.new
    subject.stormy = true
    expect { subject.land(instance_of_plane) }.to raise_error('Stormy weather, plane cannot land')
  end

  it 'checks that a plane on the ground cannot take off if the weather is stormy' do
    instance_of_plane = Plane.new
    subject.stormy = false
    subject.land(instance_of_plane)
    subject.stormy = true
    expect { subject.take_off(instance_of_plane) }.to raise_error('Stormy weather, plane cannot take off')
  end

end
