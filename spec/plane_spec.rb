require 'plane'

describe Plane do
  it "a plane exists" do
  end

  it "it responds to landed to confirm if it has landed" do
    expect(subject).to respond_to :landed
  end

  it "returns false to landed when it has taken off" do
    airport = Airport.new
    airport.takeoff(subject)
    expect(subject.landed).to eq false
  end

end
