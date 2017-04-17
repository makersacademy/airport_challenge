require 'airport'
#require 'plane'

describe Airport do
  subject(:airport) { described_class.new}

  it 'lands plane' do
    expect(airport).to respond_to(:land).with(1).argument
  end
end
