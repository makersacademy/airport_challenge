require "weather.rb"

describe Weather do

  describe "#weather?" do
      it "should allow the plane to leave an airport if the weather is not stormy" do  # <--user story 3
        if @weather_conditions == :ok_weather
        expect(subject.weather?).to respond_to(:leave_airport)
    end
  end

      it "should instruct a plane that there is stormy weather, so that plane does not leave an airport" do # <--user story 3
        if @weather_conditions == :stormy
        expect { subject.leave_airport Plane.new }.to raise_error "Due to stormy weather, plane cannot take off"
    end
  end

      it "should allow a plane to land if the weather is not stormy" do    # <--user story 4
        if @weather_conditions == :ok_weather
        expect(subject.weather?).to respond_to(:land_in_airport).with(1).argument
    end
  end

    it "should instruct a plane to not land in the airport if there is stormy weather conditions" do # <--user story 4
      if @weather_conditions == :stormy
      expect { subject.land_in_airport Plane.new }.to raise_error "Due to stormy weather, plane cannot currently land in airport"
      end
    end
  end
end
