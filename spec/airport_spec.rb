require 'airport'

describe Airport do

  describe "#check_for_storms" do
    it "checks to see if the weather is stormy" do
      bad_weather = instance_double('Weather')
      allow(bad_weather).to receive_messages(:stormy? => true)
      subject.get_weather_status(bad_weather)
      expect(subject.check_for_storms).to eq(true)
    end
  end

  describe "#runway_land" do

    context "one plane requests to land" do
      it "allows plane to land on it" do
        good_weather = instance_double('Weather')
        allow(good_weather).to receive_messages(:stormy? => false)
        subject.get_weather_status(good_weather)
        expect(subject.runway_land("plane1")).to include("plane1")
      end
    end

    context "three planes request to land" do
      it "allows planes to land on it" do
        good_weather = instance_double('Weather')
        allow(good_weather).to receive_messages(:stormy? => false)
        subject.get_weather_status(good_weather)
        subject.runway_land("plane1")
        subject.runway_land("plane2")
        expect(subject.runway_land("plane3")).to include("plane1", "plane2", "plane3")
      end
    end

    it "does not allow planes to takeoff during stormy weather" do
      bad_weather = instance_double('Weather')
      allow(bad_weather).to receive_messages(:stormy? => true)
      subject.get_weather_status(bad_weather)
      expect(subject.runway_land("plane")).to eq("Planes are prohibited to land due to adverse weather conditions")
    end

    it "does not allow planes to land when the hangar is full at default 10" do
      good_weather = instance_double('Weather')
      allow(good_weather).to receive_messages(:stormy? => false)
      subject.get_weather_status(good_weather)
      subject.hangar_capacity.times { subject.runway_land("plane") }
      expect(subject.runway_land("plane")).to eq("Planes are prohibited to land due to hangar at max. capacity")
    end

    it "allows the user to change the default capacity(10) of the hanger allowing 15 planes to land" do
      heathrow = Airport.new(15)
      good_weather = instance_double('Weather')
      allow(good_weather).to receive_messages(:stormy? => false)
      heathrow.get_weather_status(good_weather)
      14.times { heathrow.runway_land("plane") }
      expect(heathrow.runway_land("plane")).to eq(["plane", "plane", "plane", "plane", "plane", "plane", "plane", "plane", "plane", "plane", "plane", "plane", "plane", "plane", "plane"])
    end
  end
    
  describe "#runway_takeoff" do
    it "allows the plane to takeoff" do
      good_weather = instance_double('Weather')
      allow(good_weather).to receive_messages(:stormy? => false)
      subject.get_weather_status(good_weather)
      airbusA380 = instance_double('Airplane')
      allow(airbusA380).to receive_messages(:flying? => false)
      expect(subject.runway_takeoff(airbusA380)).not_to include(airbusA380)
    end

    it "does not allow the plane to takeoff during stormy weather" do
      bad_weather = instance_double('Weather')
      allow(bad_weather).to receive_messages(:stormy? => true)
      subject.get_weather_status(bad_weather)
      airbusA380 = instance_double('Airplane')
      allow(airbusA380).to receive_messages(:flying? => false)
      expect(subject.runway_takeoff(airbusA380)).to eq("Planes are grounded due to adverse weather conditions")
    end

    context "when a plane isn't flying" do
      it "checks a plane's status before asking it to takeoff" do
        good_weather = instance_double('Weather')
        allow(good_weather).to receive_messages(:stormy? => false)
        subject.get_weather_status(good_weather)
        airbusA380 = instance_double('Airplane')
        allow(airbusA380).to receive_messages(:flying? => false)
        expect(subject.runway_takeoff(airbusA380)).not_to include(airbusA380)
      end
    end

    context "when a plane is flying" do
      it "checks a plane's status before asking it to takeoff" do
        good_weather = instance_double('Weather')
        allow(good_weather).to receive_messages(:stormy? => false)
        subject.get_weather_status(good_weather)
        airbusA380 = instance_double('Airplane')
        allow(airbusA380).to receive_messages(:flying? => true)
        expect(subject.runway_takeoff(airbusA380)).to eq "The plane is already flying"
      end
    end
  end

end
