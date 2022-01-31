require "plane"
require "airport"

describe Plane do
  it { is_expected.to respond_to :landed }

  it 'can check the weather' do
    plane = Plane.new
    plane.check_weather
    expect(plane).to be_stormy
  end
end
