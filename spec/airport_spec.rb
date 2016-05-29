require 'airport'
# require_relative 'plane'

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
        plane = double(:plane, :landed? => false)
        error = 'Sorry, we\'re full. Try somewhere else'
        Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
        expect { subject.land(plane) }.to raise_error error
      end
    end


      # ir 'only lets planes land if it is not stormy' do
      #   plane = double(:plane, :)
      # end
      # it 'only lets planes that are flying to land' do
      #   message = 'That plane is already on the gound'
      #   plane = double(:plane, :flying? => true)
      #   expect(subject.flying?(plane)).to raise_error message
      # end

    describe '#take_off'
      it 'responds to take_off' do
        expect(subject).to respond_to(:take_off).with(1).argument
      end

      it 'confirms a plane has taken off' do
        plane = double(:plane, :take_off? => true)
        expect(subject.take_off(plane)).to eq plane
      end
    end
