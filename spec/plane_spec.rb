require 'plane'
describe Plane do
  let(:a_plane) { Plane.new }
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  context 'a_plane.in_air == true' do
    it '.land' do
      expect(a_plane.land).to eq('landing')
    end
  end

end