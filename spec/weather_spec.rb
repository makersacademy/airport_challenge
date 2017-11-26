require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  it "should store weather information" do
    expect(weather).to respond_to(:stormy?)
  end

end
