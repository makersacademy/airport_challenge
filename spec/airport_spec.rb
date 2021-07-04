require 'airport'

RSpec.describe Airport do

  it { is_expected.to respond_to(:take_off) }

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'returns an airborne plane' do
    plane = Plane.new
    subject.take_off(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it 'returns a landed plane' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.land(plane)).to eq plane
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
 
  it "raises error if airport full" do
    subject.capacity.times { subject.land Plane.new }
    p @hangar
    expect { subject.land Plane.new }.to raise_error "Airport is full"
   end
end