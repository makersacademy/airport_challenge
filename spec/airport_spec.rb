require 'airport'
require 'plane'


describe Airport do

  it 'should respond to land plane' do

    expect(subject).to respond_to(:land)
  end

  it 'will instruct the plane to takeoff and not be in the airport anymore' do
    num_planes = subject.hangar.length
    subject.takeoff
    expect(subject.hangar.length).to eq(num_planes - 1)
  end

  it 'should not let a plane land if the hangar is full' do
    subject.capacity.times{ subject.hanger.push(Plane.new) }
    expect{ subject.land(Plane.new) }.to raise_error(IndexError)
  end

  it 'should not let a plane takeoff if the hangar is empty' do
    subject.hangar = []
    expect{ subject.takeoff }.to raise_error(IndexError)
  end

end