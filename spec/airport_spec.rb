require 'airport'

describe Airport do
  it 'should assign a default capacity when initialised' do
    expect(subject.capacity).not_to be_nil
  end

  it 'should have a default capacity of 1' do
    expect(subject.capacity).to eq 1
  end

  it 'should respond to method override_capacity' do
    expect(subject).to respond_to :override_capacity
  end

  it 'should reassign default capacity with override_capacity' do
    expect(subject.override_capacity(5)).to eq subject.capacity
  end

  it 'should store a plane that has landed' do
    plane = Plane.new
    expect(plane.land(subject)).to eq(subject.planes)
  end

  it 'should release a plane that has taken off' do
    plane = Plane.new
    plane.land(subject)
    expect(plane.take_off(subject)).to eq(subject.planes)
  end
end
