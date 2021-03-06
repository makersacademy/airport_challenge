require 'weather'

describe Weather do
  describe 'strength_of_wind' do
    it { is_expected.to respond_to :strength_of_wind }
    it 'should return the strength of the wind at that moment' do
      expect(subject.strength_of_wind).to be_between(0, 15)
    end
  end

  describe 'chances_of_rain' do
    it { is_expected.to respond_to :chances_of_rain }
    it 'should return the change of rain' do
      expect(subject.chances_of_rain).to be_between(0, 100)
    end
  end

  describe 'temperature' do
    it { is_expected.to respond_to :temperature }
    it 'should return the current temperature' do
      expect(subject.temperatures).to be_between(-20, 50)
    end
  end

  describe 'forecast' do
    it { is_expected.to respond_to :forecast }
    it 'tells me the weather forecast' do
      expect(subject.forecast[:strength_of_wind]).to be_between(0, 15)
      expect(subject.forecast[:chances_of_rain]).to be_between(0, 100)
      expect(subject.forecast[:temperatures]).to be_between(-20, 50)
    end
  end

end
