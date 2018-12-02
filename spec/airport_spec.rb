require 'airport'
require 'airplane'
require 'weather'

RSpec.describe Airport do
  let(:airport) { Airport.new }
  let(:airplane) { Airplane.new }
  let(:weather) { Weather.new }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:takeoff) }

  describe '#take off' do
    it "raise an error if try to take off" do
      allow(weather).to receive(:weather_condition) { true }
      airport.land(airplane)
      expect { airport.takeoff }.to raise_error "No planes can take off, stormy weather."
    end
  end

  it "has capacity of 20" do
    expect(Airport::DEFAULT_CAPACITY).to eq 20
  end

end
