require 'airport'

describe Airport do

  subject(:airport) { described_class.new}
  subject(:big_airport) { described_class.new 100}
  let(:plane) { double :plane, has_landed: false, is_flying: false, flying: false }
  let(:flying_plane) {double :flying_plane, has_landed: false, is_flying: true, flying: true}
  let(:plane2) { double :plane2, has_landed: true}
  let(:weather) { double :weather, stormy: false, random_weather: 10 }
  let(:bad_weather) { double :bad_weather, stormy: true, random_weather: 95 }

  describe '#initialize' do

    it 'has a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'also has a variable capacity' do
      big_airport.capacity.times { big_airport.land((double :plane, has_landed: true), weather)}
      expect {big_airport.land(plane, weather)}.to raise_error "Can't land! This airport is full ..."
    end

  end

  describe '#update_conditions' do

    it 'updates current weather conditions for the aiport' do
      expect(airport.update_conditions(weather)).to eq 10
    end

  end

  describe '#land' do

    it 'should instruct a plane to land and receive confirmation that it has landed' do
      airport.land(plane, weather)
      expect(airport.planes).to eq [plane]
    end

    it 'should raise an error if weather is stormy' do
      expect {airport.land(plane, bad_weather)}.to raise_error "Stormy weather! It's too dangerous to land right now."
    end

    it 'should raise an error if the airport is full' do
      airport.capacity.times { airport.land((double :plane, has_landed: true), weather)}
      expect {airport.land(plane2, weather)}.to raise_error "Can't land! This airport is full ..."
    end

    it 'should raise on error if you have already landed the plane' do
      airport.land(plane, weather)
      expect {airport.land(plane, weather)}.to raise_error "That plane has already landed."
    end


  end

  describe '#takeoff' do

    it 'should instruct a plane to take and receive confirmation that it is no longer in the airport' do
      airport.land(plane, weather)
      airport.takeoff(plane, weather)
      expect(airport.planes).to eq []
    end

    it 'should raise an error if weather is stormy' do
      airport.land(plane, weather)
      airport.land(plane2, weather)
      expect{airport.takeoff(plane, bad_weather)}.to raise_error "Stormy weather! It's too dangerous to takeoff right now."
    end

    it 'should test for an edge case: planes can only take off from airports they are in' do
      airport.land(plane, weather)
      airport.land(plane2, weather)
      expect { big_airport.takeoff(plane, weather)}.to raise_error "That plane is not in this airport"
    end

    it "should test for an edge case: planes that are flying can't take off" do
      expect { airport.takeoff(flying_plane, weather)}.to raise_error "That plane is already flying"
    end

  end



end
