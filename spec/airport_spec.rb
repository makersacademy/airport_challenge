require 'airport'

class MockPlane
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

mockplane1 = MockPlane.new("Plane 1")
mockplane2 = MockPlane.new("Plane 2")

describe Airport do
  describe 'Tests for initialized instance' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:hangar) }
    it 'has @hangar as empty array' do
      expect(subject.hangar).to eq([])
    end
  end
  
  describe '#land' do
    it 'adds a plane object to @hangar and puts a confirmation message' do
      expect { subject.land(mockplane1) }.to output("Plane 1 has landed\n").to_stdout
      expect(subject.hangar).to eq([mockplane1])
      expect { subject.land(mockplane2) }.to output("Plane 2 has landed\n").to_stdout
      expect(subject.hangar).to eq([mockplane1, mockplane2])
    end
  end
end
