require "plane.rb"
require "airport.rb"

describe Plane do

  let(:airport) do
    airport = Airport.new
  end

  it { is_expected.to respond_to (:flying?) }

  it "is not flying by default" do
      expect(subject).not_to be_flying
  end

  it "sets flying to true on taking off" do
      airport.takeoff(subject)
      expect(subject).to be_flying
  end

end
