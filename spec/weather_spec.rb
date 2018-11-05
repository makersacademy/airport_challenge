require 'weather.rb'

describe Weather do
  let(:weather) { double :weather }
  it 'checks that a Weather object exists' do
    expect(subject).to be_instance_of Weather
  end
  it 'checks random weather choice' do
    allow(subject).to receive(:weather).and_return("sunny")
    expect(subject.weather).to eq("sunny")
  end

  it 'randomly selects a weather type' do
    allow(weather).to receive(:initialize).and_return("stormy")
    expect(weather.initialize).to eq "stormy"
  end
end
