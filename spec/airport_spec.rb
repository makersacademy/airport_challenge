require 'airport'
require 'plane'

describe Airport do

  it 'recieves a plane when one lands' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

end
