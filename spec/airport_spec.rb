require 'airport'

describe Airport do

  it 'instructs plane to land and confirms landing' do
    plane = Plane.new
    expect(subject.land(plane)).to eq true
  end

  it 'instructs plane to land' do
    expect(subject).to respond_to :land
  end

  it 'instructs plane to take off and confirms take off' do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq true
  end

  it 'instructs plane to take off' do
    expect(subject).to respond_to :take_off
  end

  it 'prevents landing if airport is full' do
    plane = Plane.new
    subject.land(plane)
    expect { subject.land(plane) }.to raise_error 'Airport full'
  end

end
