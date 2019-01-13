require 'airport'

RSpec.describe Airport do

  flying_plane = Plane.new
  parked_plane = Plane.new(true)

  it 'should respond to land with one argument' do
    expect(subject).to respond_to(:land).with(1).arguments
  end

  it 'should return an array with the Plane' do
    allow(subject.airport_weather).to receive(:rand).and_return(21)
    expect(subject.land(flying_plane)).to be_kind_of(Array)
  end

  it 'should not be an empty Array' do
    allow(subject.airport_weather).to receive(:rand).and_return(1)
    expect(subject.land(flying_plane)).not_to be_empty
  end

  it 'should not be nil' do
    allow(subject.airport_weather).to receive(:rand).and_return(1)
    expect(subject.land(flying_plane)).not_to be_nil
  end

  it 'should raise an error if plane wants to land in a storm' do
    allow(subject.airport_weather).to receive(:rand).and_return(92)
    expect { subject.land(flying_plane) }.to raise_error('You cannot land in a stormy weather!')
  end

  it 'should return a plane instance variable in the airport array' do
    allow(subject.airport_weather).to receive(:rand).and_return(11)
    expect(subject.land(flying_plane).last).to be_kind_of(Plane)
  end

  it 'should respond to take_off' do
    expect(subject).to respond_to(:take_off).with(1).arguments
  end

  it 'should return a confirmation that the plane took off' do
    allow(subject.airport_weather).to receive(:rand).and_return(30)
    allow(subject).to receive(:in_hangar?).with(parked_plane).and_return(true)
    expect(subject.take_off(parked_plane)).to eq('Plane took off!')

  end

  it 'should raise an error if plane wants to take off in a storm' do
    allow(subject.airport_weather).to receive(:rand).and_return(86)
    expect { subject.take_off(parked_plane) }.to raise_error('You cannot take off in a stormy weather!')
  end

  it 'should raise an error if a landed plane wants to land' do
    allow(subject.airport_weather).to receive(:rand).and_return(1)
    allow(subject).to receive(:in_hangar?).with(parked_plane).and_return(true)
    expect { subject.land(parked_plane) }.to raise_error('This plane is not flying.')
  end

  it 'should raise an error if a flying plane wants to take off' do
    allow(subject.airport_weather).to receive(:rand).and_return(2)
    expect { subject.take_off(parked_plane) }.to raise_error('This plane is already flying.')
  end

end
