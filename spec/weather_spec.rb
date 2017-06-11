require "weather.rb"

describe Weather do

let(:weather) {Weather.new}

describe "#stormy?" do
    it "responds to stormy method" do
    expect(weather).to respond_to :stormy?
    end
  end

describe "#change_weather" do
    it "can randomly change the forecast to stormy" do
    allow(weather).to receive(:change_weather) {:stormy}
    expect(weather.change_weather).to eq :stormy
    end

    it "can randomly change the forecast to sunny" do
    allow(weather).to receive(:change_weather) {:sunny}
    expect(weather.change_weather).to eq :sunny
    end
  end

end
