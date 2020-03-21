require 'weather'

describe Weather do
  it 'tells you what the weather is like at the moment' do
    expect(subject).to respond_to(:current_weather)  
  end

  it 'should tell you it is either stormy or clear' do
    1000.times do
      expect(subject.current_weather).to eq(Weather::STORMY).or eq(Weather::CLEAR)
    end
  end
end
