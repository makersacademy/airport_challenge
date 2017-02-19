require 'airport'
require 'weather'
require 'plane'

describe Airport do

    before do
    allow(@airport).to receive(:stormy?).and_return(true)
  end

  let(:plane) { Plane.new }

  subject(:airport) { described_class.new }
  let(:weather) { Weather.new }

  it {is_expected.to respond_to(:land).with(1).argument }

    
end
