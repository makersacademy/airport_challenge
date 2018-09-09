require 'airport'

class MockStormy
  def stormy
    true
  end
end

class MockNotStormy
  def stormy
    false
  end
end

describe Airport do
  describe '@hangar' do
    it 'has @hangar as empty array on initialisation' do
      expect(subject.hangar).to eq([])
    end
  end

  describe '#land' do
    it ' raises error if #land used for plane already in hangar' do
      # Set up
      mockplane1 = double(name: "Plane 1")

      # Assert
      subject.instance_eval { @hangar = [mockplane1] }
      expect { subject.land(mockplane1, MockNotStormy) }.to raise_error("Plane 1 has already landed!")
    end

    context 'when #stormy is true' do
      it 'raises storm error' do
        # Set up
        mockplane1 = double(name: "Plane 1")
        
        # Assert
        expect { subject.land(mockplane1, MockStormy) }.to raise_error("It is too stormy to do that!")
      end
    end

    context 'when #stormy is false' do
      it 'adds a plane object to @hangar and puts a confirmation message' do
        # Set up
        mockplane1, mockplane2 = double(name: "Plane 1"), double(name: "Plane 2")
        
        # Assert
        expect { subject.land(mockplane1, MockNotStormy) }.to output("Plane 1 has landed.\nThe hangar contains Plane 1.\n").to_stdout
        expect(subject.hangar).to eq([mockplane1])
        expect { subject.land(mockplane2, MockNotStormy) }.to output("Plane 2 has landed.\nThe hangar contains Plane 1, Plane 2.\n").to_stdout
        expect(subject.hangar).to eq([mockplane1, mockplane2])
      end
    end
  end

  describe '#takeoff' do
    it 'raises error if #takeoff uses plane not present in @hangar' do
      # Set up
      mockplane1 = double(name: "Plane 1")
      
      # Assert
      expect { subject.takeoff(mockplane1, MockNotStormy) }.to raise_error("Plane 1 not in the hangar!")  
    end

    context 'when #stormy is true' do
      it 'raises storm error' do
        # Set up
        mockplane1 = double(name: "Plane 1")
      
        # Assert
        expect { subject.takeoff(mockplane1, MockStormy) }.to raise_error("It is too stormy to do that!")
      end
    end
    
    context 'when #stormy is false' do
      it 'removes a plane from @hangar and puts a confirmation message' do
        # Set up
        mockplane1, mockplane2 = double(name: "Plane 1"), double(name: "Plane 2")
        subject.instance_eval { @hangar = [mockplane1, mockplane2] }
        
        # Assert
        expect { subject.takeoff(mockplane1, MockNotStormy) }.to output("Plane 1 has taken off.\nThe hangar contains Plane 2.\n").to_stdout
        expect(subject.hangar).to eq([mockplane2])
        expect { subject.takeoff(mockplane2) }.to output("Plane 2 has taken off.\nThere are no planes in the hangar.\n").to_stdout
        expect(subject.hangar).to eq([])
      end
    end
  end

  # Test for private methods
=begin
  describe '#weather_check' do
    it { is_expected.to respond_to(:weather_check).with(1).argument }

    it 'raises error message if stormy is true' do
      expect { subject.weather_check(true) }.to raise_error("It is too stormy to do that!")
    end

    it 'passes if stormy is false' do
      expect { subject.weather_check(false) }.not_to raise_error
    end
  end
=end

  describe '#display_hangar (private)' do
    it 'displays @hangar elements in user-friendly format' do
      # Set up
      mockplane1, mockplane2 = double(name: "Plane 1"), double(name: "Plane 2")
      
      # Assert
      expect(subject.send(:display_hangar)).to eq("There are no planes in the hangar.")
      subject.instance_eval { @hangar = [mockplane1] }
      expect(subject.send(:display_hangar)).to eq("The hangar contains Plane 1.")
      subject.instance_eval { @hangar = [mockplane1, mockplane2] }
      expect(subject.send(:display_hangar)).to eq("The hangar contains Plane 1, Plane 2.")
    end
  end

  describe '#confirmation (private)' do
    context 'when called inside #land' do
      it 'returns name of Plane landing' do
        mockplane1 = double(name: "Plane 1")
        expect(subject.send(:confirmation, "landed", mockplane1)).to eq("Plane 1 has landed.")
      end
    end

    context 'when called inside #takeoff' do
      it 'returns name of Plane taking off' do
        mockplane1 = double(name: "Plane 1")
        expect(subject.send(:confirmation, "taken off", mockplane1)).to eq("Plane 1 has taken off.")
      end
    end
  end
end
