require 'weather'

RSpec.describe Weather do

  describe 'can check the weather' do
    it 'for stormy weather' do
    # weather = Weather.new
    weather = double('Weather')
    allow(weather).to receive(:forecast) { :stormy }
  end
end

end
