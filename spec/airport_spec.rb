require 'airport'
require 'weather'
require 'plane'

describe Airport do

  let(:plane) { Plane.new }
  subject(:airport) { described_class.new }
  let(:weather) { Weather.new }

    before do
    allow(@airport).to receive(:storm?).and_return(true)
  end

  it {is_expected.to respond_to(:landing).with(1).argument }

  it 'has a default capacity' do
    expect(airport.capacity).to eq Airport::CAPACITY
  end

  it 'raises exception if capacity limit has been reached' do
    airport.capacity.times { airport.landing(plane)}
    expect{(airport.landing(plane))}.to raise_error 'No more room for planes'
end

    it 'raises an error when no more planes in airport' do
      expect {(airport.boarding) }.to raise_error 'If array of planes are empty, cannot take of without a plane'
    end

    context 'Stormy Airport' do
      before do
        allow(airport).to receive(:storm?).and_return(true)
    end

    it 'expects an error message if the plane tries to land when stormy' do
      if weather.storm? == true
      expect{(airport.landing(plane).be_truthy)}.to raise_error 'Stormy weather, cannot land'
        end
      end

    it 'expects an error if the plane tries to take off in storm' do
      if weather.storm? == true
      expect{(airport.boarding)}.to raise_error 'Sorry, weather too stormy'
    end
  end 
  end

end
