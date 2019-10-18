require 'weather'

describe Weather do
  subject { Weather.new }

  it 'Can create an instance of Weather' do
    expect(subject).to be_instance_of Weather
  end

  it 'Can return sunny when randomly choosing weather' do
    expect (subject.stub(:random_weather) {1..8}).to eq "Sunny"
  end

  it 'Can return stormy when randomly choosing weather' do
    expect (subject.stub(:random_weather) {9..10}).to eq "Stormy"
  end
end