require 'plane'

 describe Plane do

   let(:airport) {Airport.new}

   describe 'initalization' do
       it 'should have some passengers' do
       expect(subject.passengers?).to_not eq nil
      end
   end

    describe 'status' do
      it 'should give the current flight status' do
        expect(subject.status).to be :Flying
      end

      it 'should change when plane lands' do
        allow(airport).to receive(:stormy?).and_return(false)
        airport.land_plane(subject)
        expect(subject.status).to be :Landed
      end
   end
 end
