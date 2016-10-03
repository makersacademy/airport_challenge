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
  it 'has a capacity' do
    expect(subject).to respond_to :capacity
  end
  it 'has an assaignable capacity' do
   capacity = rand(200)
   subject.capacity = capacity
   expect(subject.capacity).to eq capacity
  end
end