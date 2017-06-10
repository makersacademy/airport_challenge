require 'airport'

describe Airport do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'lands a plane at the airport' do
      allow_any_instance_of(Weather).to receive(:forecast).and_return('sunny')
      current_forecast = Weather.new
      expect(current_forecast.forecast).to eq('sunny')
      plane = Plane.new
      expect(subject.land(plane)).to eq subject.planes.last
    end

    it 'raises an error if it is stormy' do
      allow_any_instance_of(Weather).to receive(:forecast).and_return('stormy')
      current_forecast = Weather.new
      expect(current_forecast.forecast).to eq('stormy')
      expect { subject.land(Plane.new) }.to raise_error("Due to stormy weather, no planes will be landing today")
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'gets a plane to take off' do
      allow_any_instance_of(Weather).to receive(:forecast).and_return('sunny')
      current_forecast = Weather.new
      expect(current_forecast.forecast).to eq('sunny')
      subject.land(Plane.new)
      subject.take_off
      expect(subject.planes.length).to eq 0
    end

    it 'raises an error if it is stormy' do
      allow_any_instance_of(Weather).to receive(:forecast).and_return('stormy')
      current_forecast = Weather.new
      expect(current_forecast.forecast).to eq('stormy')
      expect { subject.take_off }.to raise_error("Due to stormy weather, no planes will be taking off today")
    end
  end

end
