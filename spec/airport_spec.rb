require 'airport'

describe Airport do
  let (:plane) {double :plane}
  let(:plane2) {double :plane}
  subject(:airport) {described_class.new(weather_klass)}
  let (:weather_klass) {double :weather_klass, new: weather}
  let (:weather) {double :weather}
  cap = Airport::DEFAULT_CAPACITY
  bad_weather = Airport::DENIED + 'the weather is too dangerous.'
  full = Airport::DENIED + 'the airport is full.'
  in_hanger = 'The plane is already in the airport.'
  not_in_hanger = 'The plane is not in the airport'
  describe '#initialize' do
    it 'sets the default capacity to 50' do
      expect(airport.capacity).to eq cap
    end
  end

  before do
    allow(plane).to receive(:touch_down)
    allow(plane).to receive(:cleared)
    allow(plane2).to receive(:touch_down)
    allow(weather).to receive(:stormy?)
  end
  context 'plane is landing' do
     describe '#land_plane' do
       context 'when the airport is full' do
         it 'raises an error' do
           airport2 = described_class.new(1, weather_klass)
           airport2.land_plane(plane)
           expect{airport2.land_plane(plane2)}.to raise_error full
         end
       end
       context 'when the plane is already landed at the airport' do
         it 'raises an error' do
           airport.land_plane(plane)
           expect{airport.land_plane(plane)}.to raise_error in_hanger
         end
       end
       context 'is stormy' do
         before {allow(airport).to receive(:check_weather) {true}}
         it 'does not land planes if the weather is stormy' do
           expect{airport.land_plane(plane)}.to raise_error bad_weather
         end
       end
       context 'not stormy' do
         before {allow(airport).to receive(:check_weather) {false}}
         it 'lands planes' do
           expect do
             airport.land_plane(plane)
           end.to change{subject.planes.length}.by(1)
         end
       end
     end
   end
   context 'Plane is taking off' do
     before do
       airport.land_plane(plane)
     end
     describe '#clear_plane_for_take_off' do
       context 'when the plane is not in the airport' do
         it 'raises an error' do
           airport.clear_plane_for_take_off(plane)
           expect{airport.clear_plane_for_take_off(plane)}.to raise_error not_in_hanger
         end
       end
       context 'is stormy' do
         before {allow(airport).to receive(:check_weather) {true}}
         it 'does not clear planes for take off if the weather is stormy' do
           expect do
             airport.clear_plane_for_take_off(plane)
           end.to raise_error bad_weather
         end
       end
       context 'not stormy' do
         before {allow(airport).to receive(:check_weather) {false}}
         it 'clears the plane for take off' do
           expect do
             airport.clear_plane_for_take_off(plane)
           end.to change{subject.planes.length}.by(-1)
         end
       end
     end
   end
 end
