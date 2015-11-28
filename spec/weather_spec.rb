require 'weather'

describe Weather do

subject(:weather) {described_class.new}

  it {is_expected.to respond_to(:set_the_weather)}

  it 'can set the weather' do
    subject.set_the_weather
    weathers = [:stormy, :clear, :foggy, :misty, :rainy]
    expect(weathers).to include subject.current_weather
  end
end
