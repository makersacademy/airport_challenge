require "airport"

describe Airport do

  context "#initialize" do
    it "should have a default capacity" do
      expect(subject.capacity).to eq(subject.capacity)
    end

    it "should have a climate of type string" do
      expect(subject.climate).to eq(subject.climate)
    end
  end

  context "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }

    it "should show a hangar with the plane." do
      CdG = Airport.new
      concorde = Plane.new
      expect(CdG.land(concorde)).to eq([concorde])
    end

    it "raises an error when the hangar's airport is full." do
      subject.land(Plane.new)
      expect { subject.capacity.times { subject.land(Plane.new) } }.to raise_error("The airport is full")
    end

    it "raises an error when the plane cannot land because of bad weather." do
      Ohare = Airport.new(10, "stormy")
      expect { Ohare.land(Plane.new) }.to raise_error("It's too stormy, the plane cannot land")
    end
  end

  context "#take_off" do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it "should remove the plane from its hangar." do
      the_plane = Plane.new
      subject.land(the_plane)
      subject.take_off(the_plane)
      expect(subject.hangar).not_to include(the_plane)
    end

    it "raises an error when the plane cannot land because of bad weather." do
      heathrow = Airport.new(6, "stormy")
      expect { heathrow.take_off(Plane.new) }.to raise_error("It's too stormy, the plane cannot take off")
    end
  end

  context "#stormy?" do
    it "should return true if climate is stormy" do
      heathrow = Airport.new(1, "stormy")
      expect(heathrow.send(:stormy?)).to be true
    end  
  end

end
