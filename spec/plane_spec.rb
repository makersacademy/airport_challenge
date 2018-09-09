require 'plane'

describe Plane do

  describe "#land" do

    it { expect(subject).to respond_to(:land).with(1).argument }

    it 'allows Airport to land as many planes as capacity specifies' do

      heathrow = Airport.new(20)
      allow(heathrow).to receive(:rand).and_return(1)
      20.times { Plane.new.land(heathrow) }
      expect { Plane.new.land(heathrow) }.to raise_error("Airport is full!")

    end

    it 'fails if Airport is stormy?' do

      heathrow = Airport.new
      allow(heathrow).to receive(:rand).and_return(7)
      expect { subject.land(heathrow) }.to raise_error("Too stormy to land!")
  
    end
  
    it "fails if Airport is full?" do
  
      heathrow = Airport.new
      allow(heathrow).to receive(:rand).and_return(1)
      10.times { Plane.new.land(heathrow) }
      expect { subject.land(heathrow) }.to raise_error("Airport is full!")
  
    end

  end

end
