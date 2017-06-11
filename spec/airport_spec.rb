require 'airport'
require 'plane'

describe Airport do

  let(:plane) { double :plane }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'raises an error if it is stormy' do
      allow_any_instance_of(Weather).to receive(:forecast).and_return('stormy')
      current_forecast = Weather.new
      expect(current_forecast.forecast).to eq('stormy')
      expect { subject.land(double(:plane)) }.to raise_error("Due to storms, no planes will land today")
    end

    it 'raises an error if the airport is full' do
      allow_any_instance_of(Weather).to receive(:forecast).and_return('sunny')
      Airport::DEFAULT_CAPACITY.times { subject.land(double(:plane)) }
      expect { subject.land(double(:plane)) }.to raise_error("The airport is full")
    end

    it 'lands a plane at the airport' do
      allow_any_instance_of(Weather).to receive(:forecast).and_return('sunny')
      expect(subject.land(double(:plane))).to eq subject.planes.last
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'gets a plane to take off' do
      allow_any_instance_of(Weather).to receive(:forecast).and_return('sunny')
      subject.land(double(:plane))
      subject.take_off
      expect(subject.planes.length).to eq 0
    end

    it 'raises an error if it is stormy' do
      allow_any_instance_of(Weather).to receive(:forecast).and_return('stormy')
      current_forecast = Weather.new
      expect(current_forecast.forecast).to eq('stormy')
      expect { subject.take_off }.to raise_error("Due to storms, no planes will take off today")
    end

    it 'raises an error if the airport is empty' do
      allow_any_instance_of(Weather).to receive(:forecast).and_return('sunny')
      expect { subject.take_off }.to raise_error("There are no planes available")
    end
  end
end
