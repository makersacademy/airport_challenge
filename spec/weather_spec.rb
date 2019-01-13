require 'weather'

RSpec.describe Weather do

  describe 'can check weather' do
    it 'stormy' do
      weather = double('Weather')
      allow(weather).to receive(:forecast) { :stormy }
    end
  end
end
