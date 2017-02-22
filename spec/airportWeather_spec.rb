require 'airport'

describe Airport do
  let(:airport) { described_class.new }
  let(:plane) { Plane.new }

  before do
    allow_any_instance_of(Weather).to receive(:stormy?) { false }
  end

  describe "#weather", :weather_tests do

    context "checking LANDING with varying weather conditions" do
      it "prevents the plane from landing during stormy weather" do
        # set weather to stormy
        allow_any_instance_of(Weather).to receive(:stormy?) { true }
        message = "Landing not permitted due to stormy weather."
        expect{airport.instruct_to_land(plane)}.to raise_error(message)
      end

      it "allows the plane to land when weather is NOT stormy" do
        expect(airport.instruct_to_land(plane)).to eq(airport)
      end
    end

    context "checking TAKE OFF with varying weather conditions" do
      it "prevents the plane from taking off during stormy weather" do
        airport.instruct_to_land(plane)
        # storm occurs while plane is in airport
        allow_any_instance_of(Weather).to receive(:stormy?) { true }
        message = "Take off not permitted due to stormy weather."
        expect{airport.take_off(plane)}.to raise_error(message)
      end

      it "allows the plane to take off when weather is NOT stormy" do
        airport.instruct_to_land(plane)
        expect(airport.take_off(plane)).to eq airport.plane_arr
      end
    end
  end
end
