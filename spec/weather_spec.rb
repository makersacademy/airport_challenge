require "weather"

describe Weather do

    describe "current_conditions" do

        it "returns the current conditions - stormy or clear" do
            expect(subject.current_conditions).to eq("clear").or eq("stormy")
        end
        # tests needed to test for specific outcomes - stormy at 96 or more
        # clear at 95 or less

        it "returns stormy when the risk of rain is high (over 95%)" do
            weather = Weather.new
            allow(weather).to receive(:risk_of_rain) {true}
            expect(weather.current_conditions).to eq "stormy"
        end

        it "returns clear when the risk of rain is low (95% or less)" do
            weather = Weather.new
            allow(weather).to receive(:risk_of_rain) {false}
            expect(weather.current_conditions).to eq "clear"
        end
        
    end
end
