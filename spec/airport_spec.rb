require 'airport'

describe Airport do
  it 'has weather' do
    expect(subject).to respond_to :weather
  end
  it 'has differing weather conditions' do
    weather = []
    100.times{ weather << subject.change_weather }
    expect(weather).to include('clear') and expect(weather).to include('clear') 
  end
end