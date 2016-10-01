require 'airport'

describe Airport do
    it { is_expected.to respond_to(:land) }
    it { is_expected.to respond_to(:take_off) }

    it 'lands the plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq(plane)
    end

    it 'allows plane to take off' do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq(plane)
    end
end
