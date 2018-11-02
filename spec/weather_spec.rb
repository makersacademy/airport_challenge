require 'weather'

describe Weather do
  describe '#what_is_weather' do
    it { expect(subject).to respond_to(:what_is_weather) }
    it 'always has either sunny or stormy in 100 new weather patterns' do
      100.times { expect(subject.what_is_weather).to match(/sunny|stormy/) }
    end
  end
end
