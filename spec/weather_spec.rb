require 'weather.rb'

describe Weather do

  describe "#check_weather" do

    it "checks there can be Stormy weather (5% chance)" do
      allow(Weather).to receive(:rand_generator).and_return(95)
      expect(subject.check_weather).to eq "Stormy"
    end

    it "checks there can be safe weather (95% chance)" do
      allow(Weather).to receive(:rand_generator).and_return(94)
      expect(subject.check_weather).to eq "Safe to fly"
    end
  end
end
