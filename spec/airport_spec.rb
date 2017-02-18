require 'airport'
require 'weather'
require 'plane'

describe Airport do

    before do
    allow(@airport).to receive(:stormy?).and_return(true)
  end

  subject(:airport) { described_class.new }
  let(:weather) { Weather.new }

  it {is_expected.to respond_to(:land).with(1).argument }


    it 'raises an error if the weather is stormy' do
      expect(weather.stormy?).to raise_error 'Weather is stormy, cannot land' if stormy?
    end
end
