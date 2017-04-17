require 'airport'
#require 'plane'

describe Airport do
  subject(:airport) { described_class.new}

  it 'instructs plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'instructs plane to take off' do
    expect(airport).to respond_to(:take_off)
  end
end
