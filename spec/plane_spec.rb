describe Plane do
  subject(:plane) { described_class.new }

  describe '#land' do
    it 'should land the plane' do
      plane.land
      expect(plane).to be_landed
    end
  end

  describe '#take_off' do
    it 'should take off the plane' do
      plane.take_off
      expect(plane).to_not be_landed
    end
  end
end
