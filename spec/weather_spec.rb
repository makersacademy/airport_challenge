require 'weather'

describe Weather do 

  describe 'forecasts stormy weather' do 
    it 'responds to stormy weather' do 
      expect(subject).to respond_to :stormy?
    end
  end

end