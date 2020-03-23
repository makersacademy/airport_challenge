require 'weather'

describe Weather do
  it 'tells you what the weather is like at the moment' do
    expect(Weather).to respond_to(:now)  
  end

  it 'should tell you it is either stormy or clear' do
    1000.times do
      expect(Weather.now).to eq(Weather::STORMY).or eq(Weather::CLEAR)
    end
  end
end
