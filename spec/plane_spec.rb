require 'plane'

describe Plane do

  describe "#land" do

    it { expect(subject).to respond_to(:land).with(1).argument }

    it 'allows Airport to land as many planes as capacity specifies' do

      airport = Airport.new(20)
      allow(airport).to receive(:rand).and_return(1)
      20.times { Plane.new.land(airport) }
      expect { Plane.new.land(airport) }.to raise_error("Airport is full!")

    end

    it 'fails if Airport is stormy?' do

      airport = Airport.new
      allow(airport).to receive(:rand).and_return(7)
      expect { subject.land(airport) }.to raise_error("Too stormy to land!")
  
    end
  
    it "fails if Airport is full?" do
  
      airport = Airport.new
      allow(airport).to receive(:rand).and_return(1)
      10.times { Plane.new.land(airport) }
      expect { subject.land(airport) }.to raise_error("Airport is full!")
  
    end

    it "fails if Airport already has that Plane" do

      airport = Airport.new
      allow(airport).to receive(:rand).and_return(1)
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error("Plane already landed!")

    end

  end

end
