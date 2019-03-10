# Feature lab
require 'airport'
require 'plane'

describe "Features lab:" do
  let(:airport) { Airport.new(20) }
  let(:plane) { Plane.new }

  context "When not stormy" do
    before do
      allow(airport).to receive(:stormy?).and_return false
    end
    it 'Plane landing' do
      expect { airport.land(plane) }.not_to raise_error
    end

    it 'Plane leaving' do
      expect { airport.take_off(plane) }.not_to raise_error
    end

    context 'When full' do
      it 'No activity' do
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error 'Cannot land plane; Airport full'
      end
    end
  end

  context "When stormy" do
    before do
      allow(airport).to receive(:stormy?).and_return true
    end
    it 'No activity' do
      expect { airport.land(plane) }.to raise_error 'Cannot land plane; Weather is stormy!'
    end
  end
end
