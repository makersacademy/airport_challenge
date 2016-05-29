require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }

    describe '#land' do
      it 'responds to land' do
        expect(subject).to respond_to(:land).with(1).argument
      end

      it 'confirms a plane has landed' do
        plane = double(:plane, :landed? => true)
        expect(subject.land(plane)).to eq plane
      end

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
end
