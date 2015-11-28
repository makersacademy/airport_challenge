require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  it 'confirms that plane is landed'do
  # airport = Airport.new
  # plane = Plane.new
  #airport.land(plane)
  expect(subject).to respond_to(:landed?)
  end

  it 'confirms plane is in the air' do
    # airport = Airport.new
    # plane = Plane.new
    #airport.land(plane)
    expect(subject.in_air?).to eq true
  end
end
