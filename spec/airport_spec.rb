require 'airport'

describe Airport do
  it {is_expected.to respond_to(:land).with(1).argument}
  describe '#land' do
    it 'stores plane when landed' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.plane).to eq plane
    end
  end
end
