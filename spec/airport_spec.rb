require "airport"

describe Airport do
  it { is_expected.to respond_to :can_land }
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :plane }

  it 'can land a plane' do
    Airport.new
    expect(subject.can_land).to eq true
  end

  it 'instruct plane to land' do
    Airport.new
    plane = Plane.new
    subject.land(plane)
    expect(subject.land(plane)).to eq plane
  end

end
