require 'airport'

describe Airport do

  describe "#check_for_storms" do
    it "checks to see if the weather is stormy" do
      todays_weather = instance_double('Weather')
      allow(todays_weather).to receive_messages(:stormy? => true)
      subject.get_weather_status(todays_weather)
      expect(subject.check_for_storms).to eq(true)
    end
  end


  describe "#runway_land" do
    it "allows planes to land on it" do
      plane1 = instance_double('Airplane')
      expect(subject.runway_land(plane1)).to include(plane1)
    end
  end

  describe "#runway_takeoff" do
    it "allows the plane to takeoff" do
      plane1 = instance_double('Airplane')
      todays_weather = instance_double('Weather')
      allow(todays_weather).to receive_messages(:stormy? => false)
      subject.get_weather_status(todays_weather)
      subject.runway_land(plane1)
      expect(subject.runway_takeoff(plane1)).not_to include(plane1)
    end
  end

  it "does not allow the plane to takeoff when the weather is stormy" do
    todays_weather = instance_double('Weather')
    allow(todays_weather).to receive_messages(:stormy? => true)
    subject.get_weather_status(todays_weather)
    expect(subject.runway_takeoff("plane")).to eq("Planes are grounded due to adverse weather conditions")
  end



end
