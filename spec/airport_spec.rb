require 'airport'

describe Airport do

  describe '#land_plane' do
    it {is_expected.to respond_to(:land_plane).with(1).argument}

    it 'should note that landed planes are landed' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(plane).to be_landed
    end
  end

  describe '#take_off' do
    it {is_expected.to respond_to(:take_off).with(1).argument}

    it 'should note that in-flight planes are not landed' do
    plane = Plane.new
    subject.take_off(plane)
    expect(plane).to_not be_landed
    end
  end
end
