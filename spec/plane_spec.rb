require 'plane'
require 'airport'

RSpec.describe Plane do

  let(:airport) { Airport.new }

  context "responds to methods" do
    it { is_expected.to respond_to(:land_at).with(1) }
    it { is_expected.to respond_to(:takeoff) }
  end

  it "gets assigned an airport when created" do
    expect(subject.land_at(airport)).to eq "Landed at airport #{airport.name}"
  end

  it "changes status to :landed once the plane has landed at an airport" do
    subject.land_at(airport)
    expect(subject.status).to eq :landed
    expect(subject.airport).to eq airport
  end

  it "changes status to :flying once the plane has taken off in an airport" do
    subject.land_at(airport)
    subject.takeoff
    expect(subject.status).to eq :flying
    expect(subject.airport).to be_nil
  end

end
