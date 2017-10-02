require 'airport'

describe Airport do

  class FakePlane
    attr_accessor :landed, :airport

    def initialize
      @landed = false
    end

    def landed?
      @landed
    end

    def take_off
      @landed = false
    end

    def land
      @landed = true
    end

  end

  let(:plane) { FakePlane.new }

  # Not Stormy Weather
  let(:weather) do
    weather = double :weather
    allow(weather).to receive(:stormy?).and_return false
    weather
  end
  let(:subject) { Airport.new('Heathrow', weather) }

  context 'not stormy weather' do

    describe '#initialize' do
      it 'should have a name' do
        expect(subject.name).to eq 'Heathrow'
      end
      it 'should hold zero amount of planes' do
        expect(subject.planes).to be_empty
      end
      it 'should have a weather object instantiated' do
        expect(subject.weather).to eq weather
      end
      it 'should have a capacity limit' do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end
      it 'should have a override capability for capacity' do
        jfk = Airport.new('JFK', weather, 30)
        expect(jfk.capacity).to eq 30
      end
    end

    describe '#land_plane' do
      it "should instruct a plane to land" do
        subject.land_plane(plane)
        expect(subject.planes[0]).to eq plane
      end
      it "should raise an error if plane has already landed" do
        subject.land_plane(plane)
        expect { subject.land_plane(plane) }.to raise_error "Sorry plane has already landed!"
      end
      it 'should prevent a plane landing if airport is full' do
        20.times { subject.land_plane(FakePlane.new) }
        expect { subject.land_plane(FakePlane.new) }.to raise_error "Sorry airport is full!"
      end
    end

    describe '#take_off' do
      it "should instruct a plane to take off" do
        subject.land_plane(plane)
        expect(subject.take_off(plane)).to eq plane
      end
      it 'should raise an error if there are no planes' do
        expect { subject.take_off(plane) }.to raise_error "Sorry, no planes!"
      end
    end

  end

  # Stormy Weather
  let(:bad_weather) do
    bad_weather = double :weather
    allow(bad_weather).to receive(:stormy?).and_return true
    bad_weather
  end

  let(:airport) { Airport.new('JFK', bad_weather) }

  context 'stormy weather' do

    describe '#land_plane' do
      it 'should not land a plane' do
        expect { airport.land_plane(plane) }.to raise_error "Sorry, too stormy to land!"
      end
    end

    describe '#take_off' do
      it 'should not allow a plane to take off' do
        allow(bad_weather).to receive(:stormy?).and_return false
        airport.land_plane(plane)
        allow(bad_weather).to receive(:stormy?).and_return true
        expect { airport.take_off(plane) }.to raise_error "Sorry, too stormy to take off!"
      end
    end
  end

end
