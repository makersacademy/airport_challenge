require "weather.rb"

describe Weather do

let(:weather) {Weather.new}

  it "responds to stormy method" do
  expect(weather).to respond_to :stormy
  end

end
