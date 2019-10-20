require "weather"

describe Weather do

  context "is stormy" do

    it "is expected to be stormy" do
      airport = double(:airport, stormy: true)
      expect(airport.stormy).to eq true
    end

    #it "does not allow plane to take off" do
    #  airport = double(:airport, stormy: true)
    #  plane = double(:plane)
    #  airport.takeoff
    #  allow(airport).to receive(:stormy).and_return(true)
    #  expect { airport.takeoff }.to raise_error "Cannot take off in stormy weather"
    #end

  end

  context "is sunny" do

    it "is expected to be sunny" do
      airport = double(:airport, stormy: false)
      expect(airport.stormy).to eq false
    end

  end

end
