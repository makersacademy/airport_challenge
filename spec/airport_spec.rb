require 'airport'

describe Airport do
  # responds to basic methods
  it { is_expected.to respond_to :planes }
  it { is_expected.to respond_to(:land).with(1).argument }

  # landing planes
  it 'allows planes to land' do
    plane = Plane.new
    expect(subject.land(plane))
  end

  # plane leaves airport
  it 'allows plans to take off' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off).to eq plane
  end
end
