require 'airport'

describe Airport do
  it { is_expected.to respond_to :land }

  describe '#land' do
    it 'should add plane to landed planes' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include plane
    end
  end
end
