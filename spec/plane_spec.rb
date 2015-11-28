require 'plane'

describe Plane do

subject(:plane) {described_class.new}
let(:airport) {double(:airport)}

  it 'allows confirmation that the plane has landed' do
    plane.land(airport)
    expect(plane.status).to eq :on_the_ground
  end

  it 'allows confirmation that the plane has taken off' do
    plane.report_taken_off
    expect(plane.status).to eq :in_the_air
  end

  it 'knows which airport it has landed at' do
    plane.land(airport)
    expect(plane.airport_at).to eq airport
  end

end
