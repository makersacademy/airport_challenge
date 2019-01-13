require 'plane'

RSpec.describe Plane do
  let(:plane) { Plane.new }

  context 'on initialisation' do
    it { expect(plane.landed).to be nil }
  end

  context 'when plane object has been landed' do
    before(:each) do
      plane.make_land(true)
    end
    it { expect(plane.landed).to be true }
  end

end
