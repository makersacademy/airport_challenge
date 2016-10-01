require "plane.rb"
require "airport.rb"

describe Plane do

  let(:airport) do
    airport = Airport.new
  end

  it { is_expected.to respond_to (:flying?) }

  it "is flying by default" do
      expect(subject).to be_flying
  end

  it "sets flying to true on taking off" do
      allow(airport).to receive(:weather) { "sunny" }
      airport.land(subject)
      airport.takeoff(subject)
      expect(subject).to be_flying
  end

end
