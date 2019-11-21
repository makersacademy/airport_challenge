require 'weather'

describe Weather do
  it 'exists!' do
    expect(subject.class).to eq Weather
  end

  it { is_expected.to respond_to(:weather) }

  describe '#weather' do  
    it 'weather to be stormy or not' do
      expect(subject.weather).to be(true).or be(false)
    end 
  end
end
