require 'weather.rb'

describe Weather do
  it 'checks that a Weather object exists' do
    expect(subject).to be_instance_of Weather
  end
  it 'checks there is a #setweather and can be set to sunny' do
    expect(subject.setweather("sunny")).to eq("It is sunny")
  end
end
