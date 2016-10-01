require 'airport'

describe Airport do
    it { is_expected.to respond_to(:land) }
    it 'lands the plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq(plane)
    end
end
