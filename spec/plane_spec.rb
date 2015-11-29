require "plane.rb"

describe Plane do

  it 'can take_of from a an airport' do
    expect(subject).to respond_to(:take_off).with(1).arguments
  end

  it 'can confirm it has taken_off?' do
    subject.take_off(double(:airport))
    expect(subject.taken_off?).to be(true)
  end
end
