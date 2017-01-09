require 'weather.rb'
context 'FEATURE TESTS' do
  describe 'Feature Test Weather' do
    it 'can be called to have weather' do
        airport = Airport.new
        is_sunny_or_stormy = airport.weather=='sunny'||airport.weather=='stormy'
        expect(is_sunny_or_stormy).to eq true
    end
  end
  describe 'Feature Test landing a plane' do
    it 'can be called as an action' do
      plane = Plane.new
      airport = Airport.new
      airport.weather= 'sunny'
      Action.new.land(plane, airport)
      expect(airport.planes).to include plane
    end
  end
  describe 'Feature test taking off a plane' do
    it 'can be called as an action' do
      plane = Plane.new
      airport = Airport.new
      airport.weather= 'sunny'
      Action.new.land(plane,airport)
      Action.new.takeoff(plane, airport)
      expect(airport.planes).not_to include plane
    end
  end
end
