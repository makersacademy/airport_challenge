require 'plane'

describe Plane do
  
  it { is_expected.to be_a Plane }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "is no longer in airport after taking off" do
    airport = Airport.new
    subject.land(airport)
    subject.take_off(airport)
    expect(airport.hangar).not_to include(subject)
  end

end
