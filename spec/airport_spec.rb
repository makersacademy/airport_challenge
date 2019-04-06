require 'airport'
require 'plane'

describe Airport do

  it 'should respond to #land' do
    expect(subject).to respond_to :land
  end

  it 'should land a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end
end
