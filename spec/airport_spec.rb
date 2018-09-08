require 'airport'

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
      mockplane1 = double(:Plane, name: "Plane 1")
      mockplane2 = double(:Plane, name: "Plane 2")
      expect { subject.land(mockplane1) }.to output("Plane 1 has landed.\nThe hangar contains Plane 1.\n").to_stdout
      expect(subject.hangar).to eq([mockplane1])
      expect { subject.land(mockplane2) }.to output("Plane 2 has landed.\nThe hangar contains Plane 1, Plane 2.\n").to_stdout
      expect(subject.hangar).to eq([mockplane1, mockplane2])
    end
    it ' raises error if #land used for plane already in hangar' do
      mockplane1 = double(:Plane, name: "Plane 1")
      subject.instance_eval { @hangar = [mockplane1] }
      expect { subject.land(mockplane1) }.to raise_error("Plane 1 has already landed!")
    end
  end

  describe '#takeoff' do
    it { is_expected.to respond_to(:takeoff).with(1).argument }
    it 'removes a plane from @hangar and puts a confirmation message' do
      mockplane1 = double(:Plane, name: "Plane 1")
      mockplane2 = double(:Plane, name: "Plane 2")
      subject.instance_eval { @hangar = [mockplane1, mockplane2] }
      expect { subject.takeoff(mockplane1) }.to output("Plane 1 has taken off.\nThe hangar contains Plane 2.\n").to_stdout
      expect(subject.hangar).to eq([mockplane2])
      expect { subject.takeoff(mockplane2) }.to output("Plane 2 has taken off.\nThere are no planes in the hangar.\n").to_stdout
      expect(subject.hangar).to eq([])
    end

    it 'raises error if #takeoff uses plane not present in @hangar' do
      mockplane1 = double(:Plane, name: "Plane 1")
      expect { subject.takeoff(mockplane1) }.to raise_error("Plane 1 not in the hangar!")  
    end
  end

  # Test for private methods
  describe '#display_hangar' do
    it 'displays @hangar elements in user-friendly format' do
      mockplane1 = double(:Plane, name: "Plane 1")
      mockplane2 = double(:Plane, name: "Plane 2")
      expect(subject.display_hangar).to eq("There are no planes in the hangar.")
      subject.instance_eval { @hangar = [mockplane1] }
      expect(subject.display_hangar).to eq("The hangar contains Plane 1.")
      subject.instance_eval { @hangar = [mockplane1, mockplane2] }
      expect(subject.display_hangar).to eq("The hangar contains Plane 1, Plane 2.")
    end
  end

  describe '#confirmation' do
    it { is_expected.to respond_to(:confirmation).with(2).argument }

    context 'when called inside #land' do
      it 'returns name of Plane landing' do
        mockplane1 = double(:Plane, name: "Plane 1")
        expect(subject.confirmation("landed", mockplane1)).to eq("Plane 1 has landed.")
      end
    end

    context 'when called inside #takeoff' do
      it 'returns name of Plane taking off' do
        mockplane1 = double(:Plane, name: "Plane 1")
        expect(subject.confirmation("taken off", mockplane1)).to eq("Plane 1 has taken off.")
      end
    end
  end
end
