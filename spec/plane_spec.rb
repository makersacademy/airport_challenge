require 'plane'
describe Plane do
  let(:a_plane) { Plane.new }
  context 'a_plane.in_air == true' do
    it '#land' do
      expect(a_plane.land).to eq('landing')
    end
  end
  context 'a_place.in_air == false' do
    it '#land' do
      a_plane.flying=(false)
      expect{a_plane.land}.to raise_error("You can't land a plan that is on the ground")
    end
  end
end