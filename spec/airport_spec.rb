require 'airport'


describe Airport do

  describe '#land plane' do
    it 'instructs a plane to land' do
      plane = double (:plane)
      expect(plane).to receive(:land)
      subject.land(plane)
    end
    it 'has the plane after it landed' do
      plane = double (:plane)
      allow(plane).to receive(:land)
      subject.land(plane)
      expect(subject.planes).to include plane
    end
  end
end
