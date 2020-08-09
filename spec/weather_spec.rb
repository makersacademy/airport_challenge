require 'weather'
require 'airport'

describe Weather do 

  it { is_expected.to respond_to(:stormy?) } 
  
  describe 'stormy?' do
  	it 'returns sunny' do
  		expect(Weather.stormy?).to be "sunny"
  	end

    it 'returns stormy' do
    	expect(Weather.stormy?).to be "stormy"
    end

  end

end
