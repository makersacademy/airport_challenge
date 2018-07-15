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
  it 'allows planes to take off' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.takeoff).to eq plane
  end

  # stormy weather: prevent plane from taking off
  it 'refuses takeoff due to storm' do
    plane = Plane.new
    if subject.weather == "stormy"
      expect(subject.land(plane)).to raise_error("Takeoff not allowed due to bad weather")
    end
  end
end
