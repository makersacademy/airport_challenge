require "plane"
require "airport"

describe Plane do

  let(:airport) do
    airport = Airport.new
  end

  it {is_expected.to respond_to (:flying?) }

  it "sets flying to true on taking off" do
      airport.takeoff(subject)
      expect(subject).to be_flying
  end

end
