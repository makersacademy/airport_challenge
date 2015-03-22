require 'plane'
require 'airport'

describe 'plane location' do
  let(:plane) { Plane.new }

  it 'has landed in airport' do
    plane = Plane.new
    expect(plane.landed?).to eq true
  end

  it 'has taken off' do
    plane = Plane.new
    expect(plane.taken_off).to eq false
  end

  describe 'plane must have permission to land' do
    it 'traffic control gives ok to land' do
      airport = Airport.new
      expect(airport.ok).to eq true
    end
  end
end
