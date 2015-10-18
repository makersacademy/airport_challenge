require 'plane'

describe Plane do

  it 'take off from specific airport' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end


end
