require 'airport'
require 'plane'
describe Airport do
  subject(:airport) { described_class.new(20) }
  let ( :plane) { Plane.new }

   describe '#land' do
     it 'instructs a plane to land' do
       allow(airport).to receive(:stormy?).and_return false
       expect(airport).to respond_to(:land).with(1). argument
     end
     context 'when airport is full' do
      it 'raises error' do
      allow(airport).to receive(:stormy?).and_return false
       20.times { airport.land(plane) }
       expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport is full'
      end
     end
     context 'when stormy' do
      it 'will not let a plane land ' do
       allow(airport).to receive(:stormy?).and_return true
       expect { airport.land(plane) }.to raise_error 'Cannot land plane: too stormy'
      end
     end
   end
    describe '#take_off' do
     it 'instructs a plane to take_off' do
      allow(airport).to receive(:stormy?).and_return false
      expect(airport).to respond_to(:take_off).with(1). argument
     end
     context 'when stormy' do
      it 'will not let a plane to take off ' do
       allow(airport).to receive(:stormy?).and_return true
       expect { airport.land(plane) }.to raise_error 'Cannot land plane: too stormy'
      end
    end
  end
end




## As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate
