require './lib/airport'

describe Airport do
  let (:airport) { subject }
  let (:plane) { Plane.new }
  
  describe 'Airport should respond to messages' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:takeoff) }
  end
  
  describe 'hangar' do
    it 'should create a hanger for a new Airport' do
      expect(subject.hangar).to eq []
    end
    
    describe 'capacity' do
      it 'should have a default capacity of 20' do
        expect(subject.capacity).to eq 20
      end
      
      it 'should have a variable capacity' do
        expect(Airport.new(40).capacity).to eq 40
      end
    end
  end
  
  describe '#land' do
    
    it 'should add a new plane to the hangar' do
      good_weather = Weather.new
      allow(good_weather).to receive(:stormy?) { false }
      
      airport.land(plane, good_weather)
      
      expect(airport.hangar.last).to eq plane
    end
  
    it 'should not land a plane if the Airport is full' do
      airport = Airport.new(30)
      good_weather = Weather.new
      allow(good_weather).to receive(:stormy?) { false }
      30.times { airport.land(plane, good_weather) }
      
      expect { airport.land(Plane.new, good_weather) }.to raise_error "Airport is full, cannot land plane"
    end
  
    describe 'weather conditions' do
      it 'should not land a plane if the weather is stormy' do
        bad_weather = Weather.new
        allow(bad_weather).to receive(:condition) { "Stormy" }

        expect { airport.land(plane, bad_weather) }.to raise_error "Too stormy to land"
      end
    end
  end

  describe '#takeoff' 
  it 'should remove plane from hangar' do
    good_weather = Weather.new
    allow(good_weather).to receive(:stormy?) { false }

    airport.land(plane,good_weather)
    airport.takeoff
    
    expect(airport.hangar).not_to include plane
  end

  it 'cannot takeoff if there are no planes' do
    good_weather = Weather.new
    allow(good_weather).to receive(:stormy?) { false }

    expect { airport.takeoff(good_weather) }.to raise_error "No planes to takeoff"
  end

  describe 'weather conditions' do
    it 'plane should not takeoff if the weather is stormy' do
      bad_weather = Weather.new
      allow(bad_weather).to receive(:condition) { "Stormy" }

      expect { airport.takeoff(bad_weather) }.to raise_error "Too stormy to take off"
    end
  end
end

describe Weather do
  it 'Should generate random weather' do
    expect(Weather::CONDITIONS).to include subject.condition
  end

  describe '#stormy' do
    it 'should return true if conditions are stormy' do
      allow(subject).to receive(:condition) { "Stormy" }

      expect(subject.stormy?).to eq true
    end
  end
end
