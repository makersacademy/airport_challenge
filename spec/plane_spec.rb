require 'plane'
describe Plane do
  describe '#to_air' do
    it 'moves a plane from the ground to the air' do
      subject.to_air
      expect(subject.flying).to eq(true)
    end
  end
  describe '#to_ground' do
    it 'moves a plane from the air to the ground' do
      subject.to_ground
      expect(subject.flying).to eq(false)
    end
  end
end
