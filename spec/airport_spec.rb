require 'airport'

class MockPlane
  "mockplane"
end

describe Airport do
  describe 'Tests for initialized instance' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:hangar) }
    it 'has @hangar as empty array' do
      expect(subject.hangar).to eq([])
    end
  end
  
  describe '#land' do
    it 'adds a plane object to @hangar' do
      mockplane = MockPlane.new
      subject.land(mockplane)
      expect(subject.hangar).to eq([mockplane])
    end

    it 'adds multiple planes to @hangar' do
      mockplane = MockPlane.new
      subject.land(mockplane)
      subject.land(mockplane)
      expect(subject.hangar).to eq([mockplane, mockplane])
    end
  end
end
