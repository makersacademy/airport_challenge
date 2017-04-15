require 'airport'

describe Airport do
  it { is_expected.to respond_to :land }

  let(:plane) { Plane.new }

  describe '#land' do
    it 'should add plane to landed planes' do
      subject.land(plane)
      expect(subject.planes).to include plane
    end
  end
end
