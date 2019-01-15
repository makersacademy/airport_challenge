require "airport"

describe Airport do
  subject(:airport) { described_class.new }
  it 'lands an airplane' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'allows plane to takeoff'do
    expect(airport).to respond_to(:take_off).with(1).argument
  end 

end