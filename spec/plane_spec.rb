require 'plane'
require 'airport'
describe Plane do

  it 'Can receive the "land" command with 2 arguments.' do
    expect(subject).to respond_to(:land).with(2).argument
  end

  it 'Can receive the "take_off" command with 2 arguments.' do
    expect(subject).to respond_to(:take_off).with(2).argument
  end

  it 'Will not be allowed to take-off during stormy weather' do
    weather = double(:Weather, :stormy? => true)
    a = Airport.new
    expect{(subject.take_off(a))}.to raise_error{'The weather is too stormy to take-off'}
  end
end
