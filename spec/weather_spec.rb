require 'weather'

describe Weather do

#  let(:weather) { Weather.new }

  describe '#stormy' do

    it 'assigns true (5% chance) or false to stormy instance variable' do
      expect([TrueClass, FalseClass]).to include(Weather.stormy?.class)
    end

  end

end
