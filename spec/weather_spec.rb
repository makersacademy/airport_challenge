require './lib/weather'

describe Weather do
  it 'is of class Weather' do
    expect(subject).to be_instance_of Weather
  end
end