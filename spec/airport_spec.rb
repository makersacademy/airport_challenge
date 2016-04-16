require 'airport'

describe Airport do 

  describe 'launching a plane' do 
    it 'responds to launch_plane' do 
      expect(subject).to respond_to :launch_plane
    end
    
  end

end