require 'plane'
require 'airport'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { Airport.new(weather) }
  let(:weather) { double :Weather, stormy?: false }

  describe '#status' do

    it "returns the current status of the plane" do
      expect(subject.status).to eq "In air"
    end

    it "shows plane is at the airport if landed" do
      airport.land(subject)
      expect(subject.status).to eq "At airport"
    end

    it "shows plane is in air after taking off" do
      airport.land(subject)
      airport.take_off(subject)
      expect(subject.status).to eq "In air"
    end
  end

end
