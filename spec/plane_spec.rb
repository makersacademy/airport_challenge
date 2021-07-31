require "plane"

describe Plane do
  it "it able to #land" do
    test_airport = Airport.new
    expect { test_airport.land(subject) }.not_to raise_error
  end

  it "is stored in the hanger once landed" do
    test_airport = Airport.new
    test_airport.land(subject)
    expect(test_airport.hanger).not_to eq []
    expect(test_airport.hanger).to include(subject)
  end

end
