require 'airport'

describe Airport do

  describe 'land' do
    it 'allows a plane to land' do
      expect { plane.land }.to eq plane
    end
  end


  
end
