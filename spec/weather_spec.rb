require 'weather'

describe Weather do

    it "forecast's calm" do
        expect(Weather.forecast(1)).to eq 'calm'
    end

    it "forecast's stormy" do
        expect(Weather.forecast(2)).to eq 'stormy'
    end
end
