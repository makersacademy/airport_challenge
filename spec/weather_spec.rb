require 'weather'

describe Weather do

  it 'creates an instance of the Weather class' do
    weather = Weather.new
    expect(weather).to be_instance_of(Weather)
  end

  it 'it returns a number between 0 and 4' do
    expect(subject.chance).to be_between(0, 4)
  end

  it 'generates the weather status randomly' do
    weather = double("weather")
    weather.stub(:chance) { 2 }
  end

end
