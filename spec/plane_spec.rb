require 'plane'

describe Plane do

  it { is_expected.to respond_to(:docked) }

  describe '#has_landed?' do
    context 'when plane has been docked' do
      plane = Plane.new
      plane.docked
      it 'has landed' do
        expect(plane).to have_landed
      end
    end
  end 

end
