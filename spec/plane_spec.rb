describe Plane do
  subject(:plane) { described_class.new }

  describe 'it should take a default value' do
    subject { Plane }
    it { should respond_to(:new).with(1) }
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
