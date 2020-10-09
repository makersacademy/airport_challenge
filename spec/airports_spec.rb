require 'airports'
require 'planes'
require 'weather'

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

  end

  describe '#full?' do

    it 'returns false when not full' do
      expect(subject.full?).to eq false
    end

    it 'returns true when full' do
      subject = Airports.new(0)
      expect(subject.full?).to eq true
    end
  end

  describe '#move_plane' do
    before do
      allow_any_instance_of(Weather).to receive(:rand).and_return(50)
    end

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
      allow_any_instance_of(Weather).to receive(:rand).and_return(50)
      @airport = Airports.new
      plane = Planes.new(@airport, 'in air')

      expect(@airport.in_air).to eq [plane]
    end

    it 'adds plane to @on_ground on init of plane (both specified AND default)' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(50)
      @airport = Airports.new
      plane_spec = Planes.new(@airport, 'landed')
      plane_default = Planes.new(@airport, 'landed')

      expect(@airport.on_ground).to eq [plane_spec, plane_default]
    end
  end

  describe '#status' do

    it 'prints where planes are' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(50)
      @airport = Airports.new
      plane = Planes.new(@airport)

      expect { @airport.status }.to output("On Ground:\n[\"#{plane.id}\"]\n----------\nIn Air\n[]").to_stdout
    end
  end
end
