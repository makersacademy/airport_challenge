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
  describe '@hangar' do
    it { is_expected.to respond_to(:hangar) }
    it 'has @hangar as empty array' do
      expect(subject.hangar).to eq([])
    end
  end
  
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it 'adds a plane object to @hangar and puts a confirmation message' do
      expect { subject.land(mockplane1) }.to output("Plane 1 has landed.\nThe hangar contains Plane 1.\n").to_stdout
      expect(subject.hangar).to eq([mockplane1])
      expect { subject.land(mockplane2) }.to output("Plane 2 has landed.\nThe hangar contains Plane 1, Plane 2.\n").to_stdout
      expect(subject.hangar).to eq([mockplane1, mockplane2])
    end
  end

  describe '#takeoff' do
    it { is_expected.to respond_to(:takeoff).with(1).argument }
    it 'removes a plane from @hangar and puts a confirmation message' do
      subject.land(mockplane1)
      subject.land(mockplane2)
      expect{ subject.takeoff(mockplane1) }.to output("Plane 1 has taken off.\nThe hangar contains Plane 2.\n").to_stdout
      expect(subject.hangar).to eq([mockplane2])
      expect{ subject.takeoff(mockplane2) }.to output("Plane 2 has taken off.\nThere are no planes in the hangar.\n").to_stdout
      expect(subject.hangar).to eq([])
    end
  end

  # Test for private methods
  describe '#display_hangar' do
    it 'displays @hangar elements in user-friendly format' do
      expect(subject.send(:display_hangar)).to eq("There are no planes in the hangar.")
      subject.land(mockplane1)
      expect(subject.send(:display_hangar)).to eq("The hangar contains Plane 1.")
      subject.land(mockplane2)
      expect(subject.send(:display_hangar)).to eq("The hangar contains Plane 1, Plane 2.")
    end
  end
end
