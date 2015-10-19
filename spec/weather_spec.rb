require 'weather'

describe Weather do
  subject { described_class.new }
  context 'The Weather' do
    it { is_expected.to respond_to(:weather_conditions) }

    it 'The weather is either sunny or stormy' do
      expect(subject.weather_conditions).to satisfy {|value| [:sunny, :stormy].include? value}
    end
  end
end
