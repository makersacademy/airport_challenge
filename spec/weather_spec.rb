require 'weather'


describe Weather do
  subject(:weather) {described_class.new}

  describe "#check_weather" do
      it "returns a random weather for today" do
        expect(subject.check_weather).to satisfy {|weather| weather == :good || weather == :stormy}
      end
    end

    describe "#stormy?" do
      it "returns true if weather is stormy" do
        stormy_weather = Weather.new
        allow(stormy_weather).to receive(:check_weather).and_return(:stormy)
        expect(stormy_weather).to be_stormy
      end
    end

end
