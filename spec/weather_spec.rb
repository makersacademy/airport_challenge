require 'weather'

describe Weather do

  describe '#weather_generator' do
    it 'responds to #weather_generator' do
      expect(subject).to respond_to :weather_generator
    end
  end

end
