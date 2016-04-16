require 'airport'
require 'plane'

describe Airport do

  it {is_expected.to respond_to(:planes)}
  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:takeoff).with(1).argument}

  describe '#land plane' do
    it 'instructs the plane to land' do
      plane = Plane.new
      subject.land(plane)
    end

    it 'has the plane after it has landed' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include plane
    end
  end

describe '#takeoff plane' do
  it 'instructs the plane to takeoff' do
    plane = Plane.new
    subject.takeoff(plane)
  end

  it 'makes sure the correct plane takes off' do
    plane = Plane.new
    expect(subject.planes). to_not include plane
  end

end

end
