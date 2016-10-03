require 'plane'

 describe Plane do


   let(:airport) {double(:airport, :the_weather=>:Sunny)}

   it { is_expected.to respond_to :status }
   it { is_expected.to respond_to :passengers? }

 describe 'initalization' do
       it 'should have some passengers' do
       expect(subject.passengers?).to_not eq nil
      end

      it 'should by flying when initialized' do
        expect(subject.status).to be :Flying
      end
   end

 describe 'status' do
      it 'should give the current flight status' do
        expect(subject.status).to be :Flying
      end

      it 'should change to Landed when plane lands' do
        airport = airport = Airport.new(5, :Sunny)
        airport.land_plane(subject)
        expect(subject.status).to be :Landed
      end

      it 'shouldn\'t have any passengers once landed' do
        airport = airport = Airport.new(5, :Sunny)
        airport.land_plane(subject)
        expect(subject.passengers?).to eq 0
      end

      it 'should have passengers ones it takes off again' do
        allow(airport).to receive(:land_plane)
        allow(airport).to receive(:take_off)
        airport.land_plane(subject)
        airport.take_off(subject)
        expect(subject.passengers?).to_not eq nil
      end


   end
 end
