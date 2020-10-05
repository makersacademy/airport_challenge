require 'weather'

describe Weather do

  it 'can create a new instance of weather' do
    expect(subject).to be_instance_of Weather
  end

  it 'can return the weather as sunny, when number is less than 80' do
    allow(Weather.new).to receive(:rand) {5} 
    expect(subject.weather).to eq 'sunny'
  end

  it 'can return the weather as stormy when the number is greater than 80' do
    allow(Weather.new).to receive(:rand) {81}
    expect(subject.weather).to eq 'stormy'
  end
end
