require 'airport'
require 'plane'

describe Airport do

  it 'Has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

    describe '#land' do
      it 'Is a method that lands planes' do
        expect(subject).to respond_to :land
      end

      it 'Instructs planes to land in the airport' do
        boeing = Plane.new
        allow(boeing).to receive(:land_plane)
        expect(subject).to receive(:land)
        subject.land(boeing)
      end

      it 'Responds with one argument' do
        expect(subject).to respond_to(:land).with(1).argument
      end
    end

    describe '#take_off' do
      it 'Has a method that takes off planes' do
        expect(subject).to respond_to :take_off
      end

      it 'Instructs planes to take off from an airport' do
        boeing = Plane.new
        all_planes = [boeing]
        allow(boeing).to receive(:take_off_plane)
        expect(subject). to receive(:take_off)
        subject.take_off(boeing)
      end

      it 'Responds with one argument' do
        expect(subject).to respond_to(:take_off).with(1).argument
      end
    end

    describe '#full?' do
      it 'Is a method that checks if the airport is full' do
        expect(subject).to respond_to :full?
      end
    end


end
