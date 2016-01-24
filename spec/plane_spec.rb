require 'plane'
describe Plane do

  it 'Can receive the "land" command with 2 arguments.' do
    expect(subject).to respond_to(:land).with(2).argument
  end

  it 'Can receive the "take_off" command with 2 arguments.' do
    expect(subject).to respond_to(:take_off).with(2).argument
  end

  it 'Will not be allowed to take-off during stormy weather' do
    weather = double(:Weather, :stormy? => true)
    airport = double(:Airport)
    message = 'The weather is too stormy to take-off.'
    expect{subject.take_off(airport, weather)}.to raise_error(message)
  end

  it 'Will not be allowed to land during stormy weather' do
    weather = double(:Weather, :stormy? => true)
    airport = double(:Airport)
    message = 'The weather is too stormy to land.'
    expect{subject.land(airport, weather)}.to raise_error(message)
  end

end
