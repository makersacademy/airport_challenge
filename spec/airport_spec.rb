require "airport"

describe Airport do
  it { is_expected.to respond_to :can_land }
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :plane }
  it { is_expected.to respond_to :take_off }

  it 'can land a plane' do
    expect(subject.can_land).to eq true
  end

  it 'instruct plane to land' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.land(plane)).to eq plane
  end

  it 'instruct plane to take off' do
    planes = []
    expect(subject.take_off).to eq planes.pop
  end

  it 'plane has left airport' do
    planes = []
    expect(planes).to be_empty
  end
end
