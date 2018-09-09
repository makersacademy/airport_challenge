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
    it 'has @hangar as empty array on instantiation' do
      expect(subject.hangar).to eq([])
    end
  end

  describe '@capacity' do
    it 'Airport::DEFAULT_CAPACITY set to 4' do
      expect(Airport::DEFAULT_CAPACITY).to eq(4)
    end

    it '@capacity set to Airport::DEFAULT_CAPACITY by default' do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

    it 'value can be set on instantiation' do
      # Set up
      subject = Airport.new(6)

      # Assert
      expect(subject.capacity).to eq(6)
    end
  end
  
  # #land requires Weather Class as argument. MockNotStormy and MockStormy used in these examples
  describe '#land' do
    it ' raises error if #land used for plane already in hangar' do
      # Set up
      mockplane1 = double(name: "Plane 1")

      # Assert
      subject.instance_eval { @hangar = [mockplane1] }
      expect { subject.land(mockplane1, MockNotStormy) }.to raise_error("Plane 1 has already landed!")
    end

    it 'raises error if hangar full' do
      # Set up
      mockplane1 = double(name: "Plane 1")
      subject.instance_eval { @hangar = [1, 2, 3, 4] } # Make @hangar size same as @capacity

      # Assert
      expect { subject.land(mockplane1, MockNotStormy) }.to raise_error("No room in hangar!")
    end

    it 'raises storm error when #stormy is true' do
      # Set up
      mockplane1 = double(name: "Plane 1")
      
      # Assert
      expect { subject.land(mockplane1, MockStormy) }.to raise_error("It is too stormy to do that!")
    end

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

  # #takeoff requires Weather Class as argument. MockNotStormy and MockStormy used in these examples
  describe '#takeoff' do
    it 'raises error if #takeoff uses plane not present in @hangar' do
      # Set up
      mockplane1 = double(name: "Plane 1")
      
      # Assert
      expect { subject.takeoff(mockplane1, MockNotStormy) }.to raise_error("Plane 1 not in the hangar!")  
    end

    it 'raises storm error when #stormy is true' do
      # Set up
      mockplane1 = double(name: "Plane 1")
      subject.instance_eval { @hangar = [mockplane1] }
        
      # Assert
      expect { subject.takeoff(mockplane1, MockStormy) }.to raise_error("It is too stormy to do that!")
    end
    
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

  # Tests for private methods
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
    it 'returns name of Plane landing inside #land' do
      mockplane1 = double(name: "Plane 1")
      expect(subject.send(:confirmation, "landed", mockplane1)).to eq("Plane 1 has landed.")
    end

    it 'returns name of Plane taking off inside #takeoff' do
      mockplane1 = double(name: "Plane 1")
      expect(subject.send(:confirmation, "taken off", mockplane1)).to eq("Plane 1 has taken off.")
    end
  end

  describe '#storm_check (private)' do
    it 'raises error if true' do
      expect { subject.send(:storm_check, MockStormy) }.to raise_error("It is too stormy to do that!")
    end

    it 'raises no error if not true' do
      expect { subject.send(:storm_check, MockNotStormy) }.not_to raise_error
    end
  end
end
