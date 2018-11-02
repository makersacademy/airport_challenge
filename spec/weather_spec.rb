require 'weather'

describe Weather do
  describe '#what_is_weather' do
    it { expect(subject).to respond_to(:what_is_weather) }

  end
end
