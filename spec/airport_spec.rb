require 'airport'

describe Airport do
  let(:plane) {Plane.new}

  it 'instruct a plane to land' do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it 'instruct a plane to take off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'raise an error if airport is full' do
    subject.capacity.times { subject.land_plane(plane) }
    expect{subject.land_plane(plane)}.to raise_error('The airport is full')
  end

  it 'raise an error if weather is stormy when landing' do
    subject.stormy
    expect{subject.land_plane(plane)}.to raise_error('Is stormy so cannot land')
  end

  it 'raise an error if weather is stormy when taking off' do
    subject.stormy
    expect{subject.take_off(plane)}.to raise_error('Is stormy so cannot take off')
  end

  it 'change default capacity' do
    subject = Airport.new(20)
    subject2 = Airport.new(30)
    expect(subject.capacity).to eq(20)
    expect(subject2.capacity).to eq(30)
  end

end
