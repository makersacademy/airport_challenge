
require 'airport.rb'

describe Airport do

  let(:plane){double(:plane, {land: "landed", takeoff: "flying"})}

    describe 'takeoff operations' do

     it 'allows a plane to take off' do
       allow(subject).to receive(:randomize_weather) { "sunny" }
       expect(plane).to receive(:takeoff)
       subject.allow_to_takeoff(plane)
     end
     it 'releases a plane' do
       allow(subject).to receive(:randomize_weather) { "sunny" }
       subject.allow_to_land(plane)
       allow(subject).to receive(:randomize_weather) { "sunny" }
       subject.allow_to_takeoff(plane)
       expect(subject.planes).not_to include(plane)
     end
   end


   describe 'landing opeartions' do

     it 'allows a plane to land' do
       allow(subject).to receive(:randomize_weather) { "sunny" }
       expect(plane).to receive(:land)
       subject.allow_to_land(plane)
     end
      it 'receives a plane' do
        allow(subject).to receive(:randomize_weather) { "sunny" }
        subject.allow_to_land(plane)
        expect(subject.planes).to include(plane)
      end
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

    it 'can set a different capacity when created' do
      airport = Airport.new 2
      expect(airport.capacity).to eq(2)
    end

    describe 'traffic control' do
      context 'when airport is full' do
        it 'does not allow a plane to land' do
          allow(subject).to receive(:randomize_weather) { "sunny" }
          subject.capacity.times {subject.allow_to_land(plane)}
          expect {subject.allow_to_land(plane)}.to raise_error "Can't authorize landing, the airport is full"
        end
      end
    end

    describe 'weather conditions' do
      context 'when weather conditions are stormy' do
        it 'does not allow a plane to take off' do
          allow(subject).to receive(:randomize_weather) { "stormy" }
          expect {subject.allow_to_takeoff(plane)}.to raise_error "Can't authorize take off, adverse weather conditions"
        end


        it 'does not allow a plane to land' do
          allow(subject).to receive(:randomize_weather) { "stormy" }
          expect {subject.allow_to_land(plane)}.to raise_error "Can't authorize landing, adverse weather conditions"
        end
      end
    end
  end
