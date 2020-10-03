require 'airports'
require 'planes'

describe Airports do

  it 'creates attribute readers on init' do
    airport = Airports.new(30)
    expect(Airports::DEFAULT_CAPACITY).to eq 20
    expect(airport.capacity).to eq 30
    expect(airport.in_air).to eq []
    expect(airport.on_ground).to eq []
  end

  describe '#initialize' do

    it 'sets default plane capacity to 20 planes' do
      # This is only a test program, normally it would be more!
      expect(subject.capacity).to eq 20
    end

    it 'creates @in_air and @on ground' do
      expect(subject.in_air).to eq []
      expect(subject.on_ground).to eq []
    end
  end

  describe '#full?' do

    it 'responds to full? method' do
      expect(subject).to respond_to(:full?)
    end
    it 'returns false when not full' do
      expect(subject.full?).to eq false
    end

    it 'returns true when full' do
      subject = Airports.new(0)
      expect(subject.full?).to eq true
    end
  end

  describe '#move_plane' do

    it 'moves plane from @on_ground to @in_air' do
      @airport = Airports.new
      plane = Planes.new(@airport)

      expect(plane.take_off).to eq [plane]
      expect(@airport.on_ground).to eq []
    end

    it 'moves plane from @in_air to @on_ground' do
      @airport = Airports.new
      plane = Planes.new(@airport, 'in air')

      expect(plane.land).to eq [plane]
      expect(@airport.in_air).to eq []
    end
  end

  describe '#add_plane' do

    it 'adds plane to @in_air on init of plane' do
    @airport = Airports.new
    plane = Planes.new(@airport, 'in air')

    expect(@airport.in_air).to eq [plane]
    end

    it 'adds plane to @on_ground on init of plane' do
    @airport = Airports.new
    plane = Planes.new(@airport, 'landed')

    expect(@airport.on_ground).to eq [plane]
    end
  end

  describe '#status' do

    it 'prints where planes are' do
      @airport = Airports.new
      plane = Planes.new(@airport)

      expect { @airport.status }.to output("On Ground:\n[\"#{plane.id}\"]\n----------\nIn Air\n[]").to_stdout
    end
  end
end
