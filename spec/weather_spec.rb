require 'weather'

describe Weather do

  let(:weather) { Weather.new }

  describe '#initialize' do

    it 'assigns true (5% chance) or false to stormy instance variable' do
      expect([TrueClass, FalseClass]).to include(weather.stormy.class)
    end

  end

end
