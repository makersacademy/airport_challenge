require "plane"

describe Plane do
  let(:airport) { double :airport }
  before { allow(airport).to receive(:land) }
  before { allow(airport).to receive(:take_off) }
  let(:weather) { double :weather, stormy?: false }

  let(:wrong_airport) { double :wrong_airport }
  it "only departs from the airport it is in" do
    airport.land(subject)
    expect { subject.depart_from(wrong_airport) }.to raise_error "Wrong airport"
  end
end
