require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double(:airport) }

  describe '#flying'
  it 'shows true when a plane is created' do
    expect(plane.flying).to eq true
  end
  it 'shows true when a plane is in the air' do
    plane.departs
    expect(plane.flying).to eq true
  end
  it 'shows false if the plane has landed' do
    plane.arrives
    expect(plane.flying).to eq false
  end

end
