require 'plane'

describe Plane do
  it 'should respond to method land' do
    expect(subject).to respond_to(:land)
  end

  it 'should land at an airport' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'should respond to method take_off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'should respond to method confirm_landed?' do
    expect(subject).to respond_to(:confirm_landed?)
  end

  it 'should return true to confirm_landed? after landing' do
    airport = Airport.new
    subject.land(airport)
    expect(subject.confirm_landed?).to eq(true)
  end

  it 'should respond to method confirm_take_off?' do
    expect(subject).to respond_to(:confirm_take_off?)
  end

end
