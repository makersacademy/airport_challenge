require 'plane'
require 'airport'

RSpec.describe Plane do

  let(:airport) { Airport.new }
  it "gets assigned an airport when created" do
    expect(subject.land_at(airport)).to eq "Landed at airport #{airport.name}"
  end

end
