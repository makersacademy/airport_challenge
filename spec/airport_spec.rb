require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }

    describe '#land' do
      it 'responds to land' do
        expect(subject).to respond_to(:land).with(1).argument
      end

      it 'confirms a plane has landed' do
        plane = Plane.new
        expect(subject.land(plane)).to eq [plane]
      end

      it 'does not allow planes to land if the aiport is full' do
        plane = double(:plane, landed: false)
        error = 'Sorry, we\'re full. Try somewhere else'
        Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
        expect { subject.land(plane) }.to raise_error error
      end
    end

    describe '#take_off'
      it 'responds to take_off' do
        expect(subject).to respond_to(:take_off).with(1).argument
      end

      it 'confirms a plane has taken off' do
        # plane = double(:plane, take_off: true)
        plane = Plane.new
        airport.land(plane)
        expect(subject.take_off(plane)).to eq [plane]
      end
end
