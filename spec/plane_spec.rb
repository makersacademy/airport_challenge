require 'plane'

describe Plane do
  let(:plane) {described_class.new}
  let(:airport) {double(:airport)}

  describe '#landed?' do

    it 'by default plane is in air' do
      expect(plane).not_to be_landed
    end

  end

describe '#land' do
  it 'leads to plane being landed' do
    plane.land(airport)
    expect(plane).to be_landed
  end
end


end
