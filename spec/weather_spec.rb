require 'weather'

describe Weather do
  weather = Weather.new

    it 'can be stormy or fine' do
      expect(weather).to respond_to :weather
    end

end
