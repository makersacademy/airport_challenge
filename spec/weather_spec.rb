require 'weather'

describe Weather do
  describe '#what_is_weather' do
    it { expect(subject).to respond_to(:what_is_weather) }
    it { expect(subject.what_is_weather).to match(/sunny|stormy/) }
  end
end
