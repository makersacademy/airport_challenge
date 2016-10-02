require 'plane'

describe Plane do
  let(:plane) { Plane.new }

  context 'when instructed to land' do
    it 'can land at an airport and confirm that it has landed' do
      plane.land
      expect(plane.landed?).to be true 
    end
  end

  it 'does not land unless instructed to land' do
    expect(plane.landed?).to be false
  end

end
