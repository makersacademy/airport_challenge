require './lib/weather.rb'

class Dummy; include Weather; end

describe Weather do
  let(:weather) {Dummy.new}
  let(:stormy_weather) {double :weather}

    it "is often fine but occasionaly stormy" do
      allow(stormy_weather).to receive(:stormy?) {true}
      expect(stormy_weather.stormy?).to be true
    end
 end
