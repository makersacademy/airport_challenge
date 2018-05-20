require 'weather'

describe Weather do
  describe '#todays_weather' do
    it 'checks the weather' do
      expect(subject.todays_weather).to_not be_nil
    end
  end
end
