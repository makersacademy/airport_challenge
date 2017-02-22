require 'airport'

describe Airport do
  let(:airport) { described_class.new }
  let(:plane) { double }

  describe "#weather", :test do

    context "checking LANDING with varying weather conditions" do
      it "prevents the plane from landing during stormy weather" do
        weather = instance_double("weather", stormy?: true )
        message = "Landing not permitted due to stormy weather."
        expect{airport.instruct_to_land(plane, weather)}.to raise_error(message)
      end

      it "allows the plane to land when weather is NOT stormy" do
        weather = instance_double("weather", stormy?: false )
        expect(airport.instruct_to_land(plane, weather)).to eq(airport)
      end
    end

    context "checking TAKE OFF with varying weather conditions" do
      it "prevents the plane from taking off during stormy weather" do
        airport.instruct_to_land(plane)
        weather = instance_double("weather", stormy?: true )
        message = "Take off not permitted due to stormy weather."
        expect{airport.take_off(plane, weather)}.to raise_error(message)
      end

      it "allows the plane to take off when weather is NOT stormy" do
        weather = instance_double("weather", stormy?: false )
        airport.instruct_to_land(plane)
        expect(airport.take_off(plane, weather)).to eq airport.plane_arr
      end
    end
  end
end
