require './lib/airport'
require './lib/plane'

describe Plane do
  jfk=Airport.new
  boeing = Plane.new

  it 'creates an instance of plane'do
   expect(subject.class).to eq Plane
  end

  context 'Plane is taking off' do
    it 'confirms plane is in departures' do
      jfk.departures(boeing)
      expect(jfk.departure_arr).to eq([boeing])
    end

    it 'confirms plane as taken off' do
      jfk.take_off
    expect(boeing.status).to eq('flying')
    end

end

  context 'plane has landed' do
    it 'confirms plane has landed' do
      jfk.land(boeing)
      expect(boeing.status).to eq(boeing)
    end

    it 'confirms plane is in arrivals' do
    expect(jfk.arrivals).to eq([boeing])
    end
  end

end
