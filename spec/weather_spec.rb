require 'weather'

describe Weather do 

  describe 'forecasts stormy weather' do 
    it 'responds to stormy weather' do 
      expect(subject).to respond_to :stormy?
    end

    it 'receives true or false states for stormy weather' do 
      allow(subject).to receive(:stormy?) { false }
    end
  end

end