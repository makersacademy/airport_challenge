require "./lib/airport.rb"

describe Airport do

  let(:plane1) {double :plane1, :land => true, :takeoff => true}

  before(:each) do
    #allow_any_instance_of(Weather).to receive(:set_weather).and_return('sunny')
    allow(subject.aweather).to receive(:set_weather).and_return('sunny')
  end

  context "When testing capacity at CLASS:Airport" do

    it "allows a plane to land if there is capacity" do
      expect(subject.allow_land(plane1)).to eq(true)
    end

    it "prevents a plane to land if there is NO capacity" do
      plane2 = double
      plane3 = double
      allow(plane2).to receive(:land).and_return(true)
      allow(plane3).to receive(:land).and_return(true)
      airport = Airport.new("London",2)
      allow(airport.aweather).to receive(:set_weather).and_return('sunny')
      airport.allow_land(plane1)
      airport.allow_land(plane2)
      expect{airport.allow_land(plane3)}.to raise_error("Cant land; NO capacity")
    end

  end

  context "When testing standard controls at CLASS:Airport" do
    it "allows a plane to takeoff if it is at that airport" do
      destination = Airport.new("Morocco")
      subject.allow_land(plane1)
      expect(subject.allow_takeoff(plane1,destination)).to eq(true)
    end

    it "does NOT allows a plane to takeoff if it is NOT that airport" do
      destination = Airport.new("Morocco")
      expect{subject.allow_takeoff(plane1,destination)}.to raise_error "The plane isnt here!"
    end

    it "returns current traffic at airport" do
      expect(subject.get_traffic).to eq(0)
    end
 end

  context "When testing weather conditions at CLASS:Airport" do
    it "lands a plane on sunny weather" do
      expect(subject.allow_land(plane1)).to eq(true)
    end

    it "does NOT land a plane on stormy weather" do
      #allow(subject.aweather).to receive(:set_weather) { 'stormy'}
      allow_any_instance_of(Weather).to receive(:set_weather) { 'stormy'}
      expect{subject.allow_land(plane1)}.to raise_error("Bad weather; no landing")
    end

    it "allows a plane to take off from at airport towards speficified destination on sunny weather" do
      subject.allow_land(plane1)
      expect(subject.allow_takeoff(plane1,Airport.new("Morocco"))).to eq(true)
    end

    it "does NOT allow a plane to take off towards speficified destination on stormy weather" do
      subject.allow_land(plane1)
      #allow(subject.aweather).to receive(:set_weather).and_return('stormy')
      allow_any_instance_of(Weather).to receive(:set_weather).and_return('stormy')
      expect{subject.allow_takeoff(plane1,Airport.new("Paris"))}.to raise_error("Bad weather; no takeoff")
    end
  end

end
