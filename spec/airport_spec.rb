require 'airport'

describe Airport do 

  let(:plane) { double :plane, flying?: true }

  describe 'launches planes' do 
    it 'responds to launch_plane' do 
      expect(subject).to respond_to :launch_plane
    end

    it 'launches a plane that flies' do 
      expect(plane).to be_flying
    end

  end

end