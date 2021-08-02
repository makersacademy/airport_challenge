require "plane"

describe Plane do
  it "can land" do
    test_airport = Airport.new
    expect { test_airport.land(subject) }.not_to raise_error
  end

  it "is stored in the hanger once landed" do
    test_airport = Airport.new
    test_airport.land(subject)
    expect(test_airport.hanger).not_to eq []
    expect(test_airport.hanger).to include(subject)
  end

  it "can take off from an airport" do # if weather is good
    test_airport = Airport.new
    test_airport.land(subject)
    expect { test_airport.take_off(subject) }.not_to raise_error
  end

  it "responds to #grounded?" do 
    expect(subject).to respond_to :grounded?
  end

  it "can confirm if it's grounded" do 
    expect(subject.grounded?).to eq false
  end

  it "can confirm if it's on the ground" do 
    expect(subject.grounded?).to eq false
  end

  it "can confirm if it's in the air" do
    test_airport = Airport.new
    test_airport.land(subject)
    expect(subject.grounded?).to eq true
  end

end
