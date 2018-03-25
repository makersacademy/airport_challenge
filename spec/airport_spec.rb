require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject(:gatwick) { described_class.new }
  let(:ggajb) { double :plane }
  let(:gbigg) { double :plane }

  describe 'a group of tests that need to call #land on plane doubles' do
    before do
      allow(ggajb).to receive(:touchdown)
      allow(gbigg).to receive(:touchdown)
    end

    it 'instructs the plane to land' do
      subject.land ggajb
    end

    it 'has the plane it has landed' do
      gatwick.land(ggajb)
      expect(gatwick.ramp).to include ggajb
    end

    it 'has no plane after takeoff' do
      gatwick.land(ggajb)
      expect(ggajb).to receive(:liftoff)
      gatwick.takeoff(ggajb)
      expect(gatwick.ramp).to eq []
    end

    # describe 'storm blocks landing' do
    #   allow(weather).to receive(:stormy?).and_return true
    #   message = 'Clearance refused due to inclement weather'
    #   expect { gatwick.land(ggajb) }.to raise_error message
    # end
    #
    # describe ' a plane can land after a storm has cleared' do
    #   allow(weather).to receive(:stormy?).and_return false
    #   expect { gatwick.land(ggajb) }.not_to raise_error
    # end
    #
    # it 'has an instance of weather' do
    #   expect (gatwick.weather).to be_an instance_of(Weather)
    # end

    it 'refuses permission to land if airport is full' do
      gatwick.land(ggajb)
      error_message = "Clearance refused due to congestion"
      expect { gatwick.land(gbigg).to raise_error(RuntimeError, error_message) }
    end
  end
end
