require 'weather'

describe Weather do

  subject(:weather) {described_class.new}

  it 'should return false if good weather' do
    allow(weather).to receive(:bad?) {false}
    expect(weather.bad?).to eq false
  end

  it 'should return true false if bad weather' do
    allow(weather).to receive(:bad?) {true}
    expect(weather.bad?).to eq true
  end
  
end
