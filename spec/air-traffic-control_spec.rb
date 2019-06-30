require 'air-traffic-control'

describe AirTrafficControl do

  describe "#check_for_storms" do
    it "checks to see if the weather is stormy" do
      bad_weather = instance_double('Weather')
      allow(bad_weather).to receive_messages(:stormy? => true)
      subject.get_weather_status(bad_weather)
      expect(subject.check_for_storms).to eq(true)
    end
  end

  describe "#pre_land_checks" do

    context "one plane requests to land" do
      it "allows plane to land" do
        good_weather = instance_double('Weather')
        allow(good_weather).to receive_messages(:stormy? => false)
        subject.get_weather_status(good_weather)
        expect(subject.pre_land_checks("plane1")).to include("plane1")
      end
    end

    context "three planes request to land" do
      it "allows planes to land on it" do
        good_weather = instance_double('Weather')
        allow(good_weather).to receive_messages(:stormy? => false)
        subject.get_weather_status(good_weather)
        subject.pre_land_checks("plane1")
        subject.pre_land_checks("plane2")
        expect(subject.pre_land_checks("plane3")).to include("plane1", "plane2", "plane3")
      end
    end

    it "does not allow planes to takeoff during stormy weather" do
      bad_weather = instance_double('Weather')
      allow(bad_weather).to receive_messages(:stormy? => true)
      subject.get_weather_status(bad_weather)
      expect(subject.pre_land_checks("plane")).to eq("Planes are prohibited to land due to adverse weather conditions")
    end

    it "does not allow planes to land when the hangar is full at default 10" do
      good_weather = instance_double('Weather')
      allow(good_weather).to receive_messages(:stormy? => false)
      subject.get_weather_status(good_weather)
      subject.hangar_capacity.times { subject.pre_land_checks("plane") }
      expect(subject.pre_land_checks("plane")).to eq("Planes are prohibited to land due to hangar at max. capacity")
    end

    it "allows the user to change the default capacity(10) of the hanger allowing 15 planes to land" do
      heathrow = AirTrafficControl.new(15)
      good_weather = instance_double('Weather')
      allow(good_weather).to receive_messages(:stormy? => false)
      heathrow.get_weather_status(good_weather)
      14.times { heathrow.pre_land_checks("plane") }
      expect(heathrow.pre_land_checks("plane")).to eq(["plane", "plane", "plane", "plane", "plane", "plane", "plane", "plane", "plane", "plane", "plane", "plane", "plane", "plane", "plane"])
    end
  end
    
  describe "#pre_take_off_checks" do
    it "allows the plane to takeoff" do
      good_weather = instance_double('Weather')
      allow(good_weather).to receive_messages(:stormy? => false)
      subject.get_weather_status(good_weather)
      airbusA380 = instance_double('Airplane')
      allow(airbusA380).to receive_messages(:flying? => false)
      expect(subject.pre_take_off_checks(airbusA380)).not_to include(airbusA380)
    end

    it "does not allow the plane to takeoff during stormy weather" do
      bad_weather = instance_double('Weather')
      allow(bad_weather).to receive_messages(:stormy? => true)
      subject.get_weather_status(bad_weather)
      airbusA380 = instance_double('Airplane')
      allow(airbusA380).to receive_messages(:flying? => false)
      expect(subject.pre_take_off_checks(airbusA380)).to eq("Planes are grounded due to adverse weather conditions")
    end

    context "when a plane isn't flying" do
      it "checks a plane's status before asking it to takeoff" do
        good_weather = instance_double('Weather')
        allow(good_weather).to receive_messages(:stormy? => false)
        subject.get_weather_status(good_weather)
        airbusA380 = instance_double('Airplane')
        allow(airbusA380).to receive_messages(:flying? => false)
        expect(subject.pre_take_off_checks(airbusA380)).not_to include(airbusA380)
      end
    end

    context "when a plane is flying" do
      it "checks a plane's status before asking it to takeoff" do
        good_weather = instance_double('Weather')
        allow(good_weather).to receive_messages(:stormy? => false)
        subject.get_weather_status(good_weather)
        airbusA380 = instance_double('Airplane')
        allow(airbusA380).to receive_messages(:flying? => true)
        expect(subject.pre_take_off_checks(airbusA380)).to eq "The plane is already flying"
      end
    end
  end

end
