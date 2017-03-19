require 'airport'
require 'plane'
require 'weather'

describe Airport do

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

    describe '#land' do
      it 'is a method that lands planes' do
        expect(subject).to respond_to :land
      end

      it 'instructs planes to land in the airport' do
        boeing = Plane.new
        allow(boeing).to receive(:land_plane)
        expect(subject).to receive(:land)
        subject.land(boeing)
      end

      it 'responds with one argument' do
        expect(subject).to respond_to(:land).with(1).argument
      end

      it 'raises an error when it is stormy' do
        boeing = Plane.new
        weather = Weather.new
        allow(subject.weather).to receive(:generate_weather).and_return("Stormy")
        expect{ subject.land(boeing) }.to raise_error("Too stormy to land the plane!")
      end

      it 'raises an error when airport capacity is full' do
          subject.capacity.times { subject.land Plane.new }
          expect { subject.land Plane new }.to raise_error("Not able to land, airport has reached its capacity.")
      end
    end

    describe '#take_off' do
      it 'has a method that takes off planes' do
        expect(subject).to respond_to :take_off
      end

      it 'instructs planes to take off from an airport' do
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
      it 'is a method that checks if the airport is full' do
        expect(subject).to respond_to :full?
      end
    end


end
