require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  it "should store randomised weather information" do
    expect(weather.stormy? == true || weather.stormy? == false).to be true
  end

end
