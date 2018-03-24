require 'airport'

describe Airport do
  it 'responds to take_off_plane' do
    expect(subject).to respond_to :take_off_plane
  end

  it 'responds to land_plane' do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it 'responds to on_bording_passangers' do
    expect(subject).to respond_to :on_bording_passangers
  end

  it 'responds to off_bording_passangers' do
    expect(subject).to respond_to :off_bording_passangers
  end

  context 'when airport operates' do
    let(:plane) { double :plane }
    let(:weather) { return Weather.new(false) }

    context 'and planes are available' do
      let(:airport) { return Airport.new(1, 30, weather) }

      it 'is possible to take off plane' do
        airport.land_plane(plane)
        airport.take_off_plane
        expect(airport).to eq(airport)
      end
    end

    context 'and planes are not available' do
      let(:airport) { return Airport.new(nil, 0, weather) }

      it 'raises an error' do
        expect{ airport.take_off_plane}.to raise_error('No planes available for take-off!')
      end
    end

    context 'and airport is not full' do
      let(:airport) { return Airport.new(0, 1, weather) }

      it 'is possible to land plane' do
        airport.land_plane(plane)
        expect(airport.planes_garage.count).to eq(1)
      end
    end

    context 'and airport is full' do
      it 'raises an error' do
        expect{ subject.land_plane(plane)}.to raise_error('Take-off is not possible. Airport is full!')
      end
    end
  end



end
