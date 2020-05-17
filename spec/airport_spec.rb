require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'lands the plane' do
    plane = @plane
    expect(subject.land(plane)).to match_array([@at_the_airport])
  end

  it { is_expected.to respond_to(:takeoff).with(1).argument }

  it 'allows the plane to takeoff' do
    plane = @Plane
    expect(subject.takeoff(plane)).to eq plane
  end

end
