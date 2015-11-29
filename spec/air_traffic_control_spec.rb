require 'air_traffic_control'

describe AirTrafficControl do

  let(:plane) {double(:plane)}
  let(:airport) {double(:airport,
                :name => "JFK",
                :bad_weather? => false,
                :planes => [],
                :full? => false)}

  context '<> Landing prevention <>' do

    it 'should prevent landing if the weather is stormy' do
      allow(airport).to receive_messages(:bad_weather? => true)
      expect{subject.approve_landing?(plane, airport)}.to raise_error "Bad weather, try again later!"
    end

    it 'should prevent landing if the destination airport is full' do
      allow(airport).to receive_messages(:full? => true)
      expect{subject.approve_landing?(plane, airport)}.to raise_error "#{airport.name} is full!"
    end

  end

  context '<> Take off prevention <>' do

    it 'should prevent take off if the weather is stormy' do
      allow(airport).to receive_messages(:bad_weather? => true)
      expect{subject.approve_takeoff?(plane, airport)}.to raise_error "Bad weather, try again later!"
    end
  end

end
