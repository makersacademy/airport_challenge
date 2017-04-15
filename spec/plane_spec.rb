require 'plane'

describe Plane do

  it { is_expected.to respond_to(:docked) }

  describe '#has_confirmed_landing?' do
    context 'when plane has been docked' do
      plane = Plane.new
      plane.docked
      it 'has confirmed landing' do
        expect(plane).to have_confirmed_landing
      end
    end
  end 

end
