require 'airport' 

describe Airport do 

  it "confirms that the plane has left the airport" do 
    plane = Plane.new
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane)
    expect(subject.take_off(plane)).to eq "The plane has left the airport"
  end 

  describe "#land" do 
    it "stops planes from landing if the airport is full" do 
      allow(subject).to receive(:stormy?) { false }
      Airport::DEFAULTCAPACITY.times { subject.land(Plane.new) }
      allow(subject).to receive(:stormy?) { false }
      expect { subject.land(Plane.new) }.to raise_error 'Unable to land, the airport is full'
    end
  end 

  describe '#take_off' do 
    it "prevents a plane from taking off if there is a storm" do 
      plane = Plane.new
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      allow(subject).to receive(:stormy?) { true }
      expect { subject.take_off(plane) }.to raise_error "It is too stormy to take off"
    end   
  end 

  describe '#land' do 
    it "prevents a plane from landing if there is a storm" do 
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land(Plane.new) }.to raise_error "It is too stormy to take off"
    end   
  end 

  describe '#take_off' do 
    it 'Doesnt allow planes to take off if there are non in the airport?' do 
      allow(subject).to receive(:stormy?) { false }
      expect { subject.take_off(Plane.new) }.to raise_error "There are no planes in the airport"
    end 
  end 

  describe '#take_off' do 
    it 'removes a specific plane from the airport' do 
      plane = Plane.new 
      plane2 = Plane.new
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane2)
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      allow(subject).to receive(:stormy?) { false }
      subject.take_off(plane2)
      expect(subject.planes[0]).to eq plane
    end 
  end    

  describe '#take_off' do 
    it 'stops planes from taking off from airport they are not in' do 
      plane = Plane.new 
      plane1 = Plane.new 
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      allow(subject).to receive(:stormy?) { false }
      expect { subject.take_off(plane1) }.to raise_error 'This plane is not in this airport'
    end 
  end 

  describe '#land' do 
    it 'stops planes from landing at multiple airports' do 
      plane = Plane.new 
      airport1 = Airport.new
      airport2 = Airport.new
      allow(subject).to receive(:stormy?) { false }
      airport1.land(plane)
      allow(subject).to receive(:stormy?) { false }
      expect { airport2.land(plane) }.to raise_error 'This plane has already landed in another airport'
    end 
  end 

end 
