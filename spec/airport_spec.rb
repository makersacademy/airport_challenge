require 'airport'

describe Airport do

  it { is_expected.to respond_to(:plane_land).with(1).argument }

  it 'lands plane' do
    plane = Plane.new
    expect(subject.plane_land(plane)).to eq [plane]
  end

  it 'plane takes off' do
    subject.plane_land(Plane.new)
    subject.plane_takeoff
    expect(subject.planes).to eq []
  end

end
