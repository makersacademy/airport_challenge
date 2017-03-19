require "Weather"

describe Weather do

  describe "#stormy?" do

    it "responds to stormy?" do
      expect(subject).to respond_to(:stormy?)
    end

    describe "Pseudo - Random Number outputs" do

      let (:weather) {Weather.new}

      it "Below 90 random output returns false" do
        allow(weather).to receive(:number_between_1_and_x).and_return(30)
        expect(weather.stormy?).to eq(false)
      end

      it "Above 90 random output returns true" do
        allow(weather).to receive(:number_between_1_and_x).and_return(95)
        expect(weather.stormy?).to eq(true)
      end

    end

  end

end
