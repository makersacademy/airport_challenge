require 'airport'
require 'plane'

describe Plane do
    let(:airport) { Airport.new }
  
    it 'checks whether a particular plane has departed from airport' do
    allow(airport).to receive(:weather) { "sunny" }
    airport.land(subject)
    expect(airport.take_off(subject)).to eq(subject)
  end

    it 'checks whether a plane instance responds to #departed?' do
        expect(subject).to respond_to(:departed?)
    end

    it 'checks whether a plane has departed' do
        allow(airport).to receive(:weather) { "sunny" }
        airport.land(subject)
        airport.take_off(subject)
        expect(subject.departed?).to eq true
    end
end