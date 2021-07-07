describe Plane do 

  describe 'responds to stormy' do 
    it {expect(subject).to respond_to(:stormy_weather?)}
  end 

  # describe 'returns true if stormy' do
  #   allow(self).to receive(:stormy_weather) { true }
  # end 
end 