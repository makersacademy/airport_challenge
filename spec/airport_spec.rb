require 'airport'

describe Airport do
  it { is_expected.to be_an_instance_of(Airport) }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    context 'if plane is already landed' do
      let(:landed_plane) { double("landed_plane", :landed => true) }
      it 'raises an error' do
        expect { subject.land(landed_plane) }.to raise_error(RuntimeError, "Plane is already landed.")
      end
    end

    
  end

end
