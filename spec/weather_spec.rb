require './lib/weather.rb'

describe 'Weather Module' do
  include Weather

  let(:weather) {double (:weather)}

  context "make sure the method right_now is working correctly" do

    it "expects that if right now is called either Sunny or Stormy is called" do


      expect(weather_today).to eq("Sunny") | eq("Stormy")
    end

    it "expects weather today to be sunny" do
    allow(weather).to receive(:weather_today) {1}

    expect(weather.weather_today).to eq 1
  end



  end
end
