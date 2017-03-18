require 'airport'

describe Airport do

  it { is_expected.to respond_to(:plane_land).with(1).argument }
  it { is_expected.to respond_to(:plane_takeoff) }

  it 'lands plane' do
    plane = Plane.new
    subject.plane_land(plane)
    expect(subject.planes).to eq [plane]
  end

  it 'confirms plane has landed' do
    expect(subject.plane_land(Plane.new)).to eq "A plane has landed"
  end

  it 'plane takes off' do
    subject.plane_land(Plane.new)
    subject.plane_takeoff
    expect(subject.planes).to eq []
  end

  it 'confirms plane has taken off' do
    subject.plane_land(Plane.new)
    expect(subject.plane_takeoff).to eq "Plane has taken off"
  end 


end
