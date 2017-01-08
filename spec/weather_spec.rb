require 'Weather'

describe Weather do
  let(:weather_if_sunny){rand(0..75)}
  let(:weather_if_stormy){rand(76..100)}

  describe 'default weather' do
    it 'expected to be sunny on default' do
      expect(subject.weather).to eq "Sunny"
    end
  end
  describe 'randomize weather' do
    it {is_expected.to respond_to :weather_generator}
    it 'should feature a randomizer' do

    end
  end

  describe 'Sunny chance' do
    it 'should be sunny 75% of the time' do
      subject.weather_generator
      expect(subject.weather).to eq ("Sunny" || "Stormy")
    end
  end



end
