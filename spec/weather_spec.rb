require './lib/weather.rb'

describe 'Weather Module' do
  include Weather

  context "make sure the method right_now is working correctly" do

    it "expects that if right now is called either Sunny or Stormy is called" do
      expect(weather_today).to eq("Sunny") | eq("Stormy")
    end

  end
end
