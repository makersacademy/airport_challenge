require 'airport'

describe Airport do

  class FakePlane
    attr_accessor :landed

    def initialize
      @landed = false
    end

    def landed?
      @landed
    end
  end

  let(:plane) { FakePlane.new }

  # Not Stormy Weather
  let(:weather) do
    weather = double :weather
    allow(weather).to receive(:stormy?).and_return false
    weather
  end

  context 'not stormy weather' do

    describe '#initialize' do
      it 'should hold zero amount of planes' do
        expect(subject.planes).to be_empty
      end
      it 'should have a capacity limit' do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end
      it 'should have a override capability for capacity' do
        expect(Airport.new(30).capacity).to eq 30
      end
    end

    describe '#land_plane' do
      it "should instruct a plane to land" do
        subject.land_plane(plane, weather)
        expect(subject.planes[0]).to eq plane
      end
      it "should raise an error if plane has already landed" do
        subject.land_plane(plane, weather)
        expect { subject.land_plane(plane, weather) }.to raise_error "Sorry plane has already landed!" if subject.planes.include? plane
      end
    end

    describe '#take_off' do
      it "should instruct a plane to take off" do
        subject.land_plane(plane, weather)
        expect(subject.take_off(plane, weather)).to eq plane
      end
      it 'should raise an error if there are no planes' do
        expect { subject.take_off(plane, weather) }.to raise_error "Sorry, no planes!"
      end
    end

  end

  # Stormy Weather
  let(:bad_weather) do
    bad_weather = double :weather
    allow(bad_weather).to receive(:stormy?).and_return true
    bad_weather
  end
  context 'stormy weather' do

    describe '#land_plane' do
      it 'should not land a plane' do
        expect { subject.land_plane(plane, bad_weather) }.to raise_error "Sorry, too stormy to land!"
      end
    end

    describe '#take_off' do
      it 'should not allow a plane to take off' do
        subject.land_plane(plane, weather)
        expect { subject.take_off(plane, bad_weather) }.to raise_error "Sorry, too stormy to take off!"
      end
    end
  end
end
