require 'weather'

describe Weather do
  weather = Weather.new

  it "gives a status" do
    expect(weather).to respond_to(:status?)
  end
end
