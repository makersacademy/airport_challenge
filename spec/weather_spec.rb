require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  it "should give weather information" do
    expect(weather).to respond_to(:stormy?)
  end

end
