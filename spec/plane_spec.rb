describe Plane do
  subject(:plane) { described_class.new}

  context 'when the plane is created' do
    it 'should default to not landed' do
      expect(plane.landed).to be false
    end
  end

  describe '#land' do
    it 'should land the plane' do
      plane.land
      expect(plane.landed).to be_truthy
    end
  end

  describe '#take_off' do
    it 'should take off the plane' do
      plane.take_off
      expect(plane.landed).to be_falsey
    end
  end
end
