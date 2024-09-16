require "airport"

describe Airport do

  context "#initialize" do
    it "should have a default capacity" do
      expect(subject.capacity).to eq(subject.capacity)
    end

    it "should have a default climate" do
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

    it "raises an error when the hangar's airport is at full defaut capacity." do
      subject.land(Plane.new)
      expect { ::DEFAULT_CAPACITY.times { subject.land(Plane.new) } }.to raise_error("The airport is full")
    end

    it "raises an error when the hangar's airport is full." do
      orly = Airport.new(4)
      orly.land(Plane.new)
      expect { orly.capacity.times { orly.land(Plane.new) } }.to raise_error("The airport is full")
    end

    it "raises an error when the plane cannot land because of bad weather." do
      Ohare = Airport.new(10, "stormy")
      expect { Ohare.land(Plane.new) }.to raise_error("It's too stormy, the plane cannot land")
    end

    it "raises an error when the plane has already landed at the airport." do
      ykk = Airport.new(3, "sunny")
      jet = Plane.new
      ykk.land(jet)
      expect { ykk.land(jet) }.to raise_error("This plane has already landed.")
    end
  end

  context "#take_off" do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it "should remove the plane from its hangar." do
      the_plane = Plane.new
      hwi = Airport.new
      hwi.land(the_plane)
      hwi.take_off(the_plane)
      expect(hwi.hangar).not_to include(the_plane)
    end

    it "raises an error when the airport is empty." do
      lax = Airport.new
      b747 = Plane.new
      expect { lax.take_off(b747) }.to raise_error("The airport is empty")
    end

    it "raises an error when the plane cannot land because of bad weather." do
      heathrow = Airport.new(6, "stormy")
      expect { heathrow.take_off(Plane.new) }.to raise_error("It's too stormy, the plane cannot take off")
    end

    it "raises an error when the plane is not at the airport for take off." do
      ohr = Airport.new(2, "sunny")
      jet = Plane.new
      boeing = Plane.new
      ohr.land(jet)
      expect { ohr.take_off(boeing) }.to raise_error("This flight is not scheduled.")
    end
  end

  context "#stormy?" do
    it "should return true if climate is stormy" do
      heathrow = Airport.new(1, "stormy")
      expect(heathrow.send(:stormy?)).to be true
    end  
  end

end
