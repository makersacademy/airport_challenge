require 'weather'

describe Weather do
  it 'exists!' do
    expect(subject.class).to eq Weather
  end

  it { is_expected.to respond_to(:check_weather) }

  it { is_expected.to respond_to(:weather) }

  describe '#weather' do  
    it 'generates a number for storm intensity' do
      allow(Weather.new).to receive(:weather).and_return(Integer)
    end
  end
end
