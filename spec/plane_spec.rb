require 'plane'
describe Plane do
  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }

  airport = Airport.new
  it "is on the airport once landed" do
    subject.land(airport)
    expect(airport.planes).to include subject
  end
  it "is not on the airport once took off" do
    subject.land(airport)
    subject.take_off(airport)
    expect(airport.planes).not_to include subject
  end
  it "confirms plane on airport" do
    subject.land(airport)
    expect(subject.status(airport)).to eq true
  end
  it "confirms plane alredy took off" do
    subject.land(airport)
    subject.take_off(airport)
    expect(subject.status(airport)).to eq false
  end

end
