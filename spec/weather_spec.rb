require 'weather'

describe Weather do

  describe "#stormy?" do 

    it "should return a true value if the random_weather is stormy" do
      expect(subject.stormy?).to eq false
    end

  end
end
