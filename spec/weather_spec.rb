require 'weather'

describe Weather do
  describe '#weather' do
    it { is_expected.to respond_to(:current_weather) }

    it 'should return either Sunny or Stormy' do
      expect(subject.current_weather).to eq("Sunny").or eq("Stormy")
    end
  end
end
