require 'weather'

describe Weather do
  describe ' #weather' do
    it 'returns weather' do
      is_expected.to respond_to :weather
    end
  end
end
