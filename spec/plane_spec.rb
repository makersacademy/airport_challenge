require 'plane'

describe Plane do
  it "should know when it is flying" do
    airport = double(:my_airport)
    allow(airport).to receive(:takeoff) do |plane|
      plane.flying = true
    end
    airport.takeoff(subject)
    expect(subject.flying).to be true
  end
end
