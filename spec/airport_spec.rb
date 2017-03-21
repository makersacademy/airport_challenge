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
    allow(plane).to receive(:weather) { "sunny" }
    expect{plane.land(subject)}.to change{ subject.planes.length }.by(1)
  end

  it 'should release a plane that has taken off' do
    plane = Plane.new
    allow(plane).to receive(:weather) { "sunny" }
    plane.land(subject)
    expect{plane.take_off(subject)}.to change{ subject.planes.length }.by(-1)
  end

  it 'should raise an error if plane attempts to land when full' do
    first_plane = Plane.new
    allow(first_plane).to receive(:weather) { "sunny" }
    subject.store_plane(first_plane)
    second_plane = Plane.new
    allow(second_plane).to receive(:weather) { "sunny" }

    expect{ subject.store_plane(second_plane) }.to raise_error("Airport is currently full.")
  end
end
