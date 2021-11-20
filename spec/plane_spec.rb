require "plane"

describe Plane do

  it "should either be flying or not" do
    expect(subject.flying).to be(true).or be(false)
  end

  it "plane is no longer flying after landing" do
    subject.flying = true
    airport = Airport.new
    airport.land(subject)
    expect(subject.flying).to eq false
  end

end
