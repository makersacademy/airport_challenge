require 'weather'

describe Weather do

  it { is_expected.to respond_to :get_weather }

  context '#get weather' do
    it 'gets sunny or stormy' do
      1000.times do
        expect(subject.get_weather).to eq(:sunny).or eq(:stormy)
      end
    end
  end
end
