require "weather"

describe Weather do

  context "is stormy" do

    it "is expected to be stormy" do
      airport = double(:airport, stormy: true)
      expect(airport.stormy).to eq true
    end

  end

  context "is sunny" do

    it "is expected to be sunny" do
      airport = double(:airport, stormy: false)
      expect(airport.stormy).to eq false
    end

  end

end
