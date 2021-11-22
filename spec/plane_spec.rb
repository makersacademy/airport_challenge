require 'plane'

describe Plane do

  describe "(taking off)" do
    
    before(:each) do
      @heathrow, @gatwick = Airport.new, Airport.new
      @heathrow.stub(:weather_ok? => true)
      @plane_a, @plane_b, @plane_c = Plane.new, Plane.new, Plane.new
      @heathrow.hangar.push(@plane_a, @plane_b, @plane_c)
      @plane_a.take_off_from(@heathrow)
    end

    it "allows user to instruct a plane to take off from an airport" do
      expect(subject).to respond_to(:take_off_from).with(1).argument
    end 

    it "changes taken off plane's flying status to 'true'" do
      expect(@plane_a.flying == true).to eq true
    end

    it "does not change non-taken off planes' flying status to 'true'" do
      expect(@plane_b.flying == false && @plane_c.flying == false).to eq true
    end

    it "removes departed plane from the airport hangar after take off" do
      expect(@heathrow.hangar.include?(@plane_a)).to eq false
    end

    it "does not remove non-departed planes from the airport hangar after take off" do
      expect(@heathrow.hangar.include?(@plane_b && @plane_c)).to eq true
    end

    it "allows allows user to check if plane is no longer in the airport" do
      expect(subject).to respond_to(:in_airport?).with(1).argument
    end

    it "returns 'true' when 'in_airport?' is called on non-taken off plane" do
      expect(@plane_b.in_airport?(@heathrow)).to eq true
    end

    it "returns 'false' when 'in_airport?' is called on taken off plane" do
      expect(@plane_a.in_airport?(@heathrow)).to eq false
    end

    context "* edge cases *" do

      before(:each) do
        @heathrow, @gatwick = Airport.new, Airport.new
        @plane_a, @plane_b, @plane_c = Plane.new, Plane.new, Plane.new
        
      end

      it "does not allow planes to take from airports in bad weather" do
        @heathrow.hangar.push(@plane_a, @plane_b, @plane_c)
        @heathrow.stub(:weather_ok? => false)
        expect { @plane_a.take_off_from(@heathrow) }.to raise_error "Stormy Weather. Cannot take off!"
      end

      it "does not allow planes to take off from airports that they are not in" do
        @heathrow.hangar.push(@plane_b, @plane_c)
        @heathrow.stub(:weather_ok? => true)
        expect { @plane_a.take_off_from(@heathrow) }.to raise_error "Plane not in airport hangar. Cannot take off!"
      end

    end

  end

  describe "(landing)" do

    before(:each) do
      @heathrow, @gatwick = Airport.new, Airport.new
      @heathrow.stub(:weather_ok? => true)
      @gatwick.stub(:weather_ok? => true)
      @plane_a, @plane_b, @plane_c = Plane.new, Plane.new, Plane.new
      @heathrow.hangar.push(@plane_a, @plane_b, @plane_c)
      @plane_a.take_off_from(@heathrow)
      @plane_b.take_off_from(@heathrow)
      @plane_c.take_off_from(@heathrow)
      @plane_a.land_at(@gatwick)
    end

    it "allows user to instruct a plane to land at an airport" do
      expect(subject).to respond_to(:land_at).with(1).argument
    end

    it "changes landed plane's flying status to 'false'" do
      expect(@plane_a.flying == false).to eq true
    end

    it "does not change non-landed plane's flying status to 'false'" do
      expect(@plane_b.flying == true && @plane_c.flying == true).to eq true
    end

    it "adds landed plane to airport hangar" do
      expect(@gatwick.hangar.include?(@plane_a)).to eq true
    end

    it "does not add non-landed planes to airport hangar" do
      expect(@gatwick.hangar.include?(@plane_b || @plane_c)).to eq false
    end

    context "* edge cases *" do

      before(:each) do
        @heathrow, @gatwick = Airport.new, Airport.new
        @heathrow.stub(:weather_ok? => true)
        @plane_a, @plane_b, @plane_c = Plane.new, Plane.new, Plane.new
        @heathrow.hangar.push(@plane_a, @plane_b, @plane_c)
        @plane_a.take_off_from(@heathrow)
        @plane_b.take_off_from(@heathrow)
        @plane_c.take_off_from(@heathrow)
      end

      it "does not allow users to land planes at full airports" do
        @gatwick.stub(:weather_ok? => true) 
        Airport::DEFAULT_CAPACITY.times { Plane.new.land_at(@gatwick) } 
        expect { @plane_a.land_at(@gatwick) }.to raise_error "Airport full. Cannot land plane!"
      end

      it "does not allow users to land planes at airports in bad weather" do   
        @gatwick.stub(:weather_ok? => false)
        expect { @plane_a.land_at(@gatwick) }.to raise_error "Stormy Weather. Cannot land plane!"
      end

      it "does not allow planes to land at airports that they are already in" do 
        @gatwick.stub(:weather_ok? => true)
        @plane_a.land_at(@gatwick)
        expect { @plane_a.land_at(@gatwick) }.to raise_error "Plane already in airport hangar. Cannot land plane!"
      end
    
    end

  end

end
