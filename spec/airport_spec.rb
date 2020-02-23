require 'airport'
describe Airport do
  it { is_expected.to respond_to :take_off }
  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    it "lands a plane" do 
      plane = Plane.new
      expect(subject.land(plane)[0]).to eq plane
    end 

    it "raises an error landing a plane thats already landed" do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error "plane already at airport"
    end
  
    it "raises an error when the airport is full" do 
      Airport::CAPACITY.times do
        subject.land(Plane.new)
      end
      expect { subject.land(Plane.new) }.to raise_error "The airport is full"
    end

    it "fails when you land an already landed plane" do 
      plane = Plane.new
      airport = subject.land(plane)
      expect { airport.land(plane) }.to raise_error
    end
    
    it "raises an error when the try to take off with no planes" do
      expect { subject.take_off }.to raise_error
    end

    it 'raises an error when you try to land in stormy weather' do
      plane = Plane.new
      allow(subject).to receive(:rand).and_return(5)
      expect { subject.land(plane) }.to raise_error
    end

  end

  describe '#take_off' do
    it "tells us when a plane takes off" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq "The plane has taken off"
    end

    it "There is one less plane in the airport when one takes off" do
      subject.land(Plane.new)
      subject.take_off(Plane.new)
      expect(subject.planes.count).to eq 0
    end

    it "raises an error when there's no plane to take off" do
      expect { subject.take_off(Plane.new) }.to raise_error
    end

    it "raises an error trying to take_off a plane thats already in the sky" do 
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      airport.take_off(plane)
      expect { airport.take_off(plane) }.to raise_error
    end
  end
end
