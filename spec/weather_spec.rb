require 'weather'


describe Weather do
        weather = Weather.new
        it "Check weather_condition? responds as a method" do
            expect(weather).to respond_to :weather_condition?
        end

        it "Check weather is sunny and stormy" do
            expect(weather.weather_condition?).to eq("Sunny").or eq("Stormy")
        end

end
