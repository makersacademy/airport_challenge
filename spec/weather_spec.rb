 require 'weather'

  describe Weather do
    describe "#weather" do
      # it "should give me stormy weather" do
      #   expect(subject.weather).to eq ("stormy")
      # end

      it "should give me the weather as soon as i initialize instance" do
        weather_today = Weather.new
        expect(weather_today.weather).to be_a(String)
      end
    end
  end
