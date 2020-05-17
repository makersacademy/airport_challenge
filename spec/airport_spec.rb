require 'airport'

# describe Airport do
#   # land
#   it { is_expected.to respond_to(:land).with(1).argument }
# end

describe Airport do
  it 'lands the plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end
end
