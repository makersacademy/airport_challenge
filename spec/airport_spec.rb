require 'airport.rb'
require 'plane.rb'

describe Airport do

  it { is_expected.to respond_to(:land_plane) }
  it { is_expected.to respond_to(:take_off_plane) }
  it { is_expected.to respond_to(:weather) }

  describe 'land_plane' do

    let(:gatwick) { Airport.new(5) }
    let(:boeing747) { Plane.new }
    let(:boeing777) { Plane.new }
    let(:boeing737) { Plane.new }

    it 'adds a plane to the airport hangar' do
      gatwick.land_plane(boeing747)
      expect(gatwick.hangar).to eq [boeing747]
    end

    it 'adds a plane to an airport hangar that already has a plane in it' do
      gatwick.land_plane(boeing747)
      gatwick.land_plane(boeing777)
      expect(gatwick.hangar).to eq [boeing747, boeing777]
    end

    it 'will only allow a plane to land if there is space' do
      expect { (Airport::DEFAULT_CAPACITY + 1).times { gatwick.land_plane(Plane.new) } }.to raise_error "There is no space in the hangar"
    end
  end

  describe 'take_off_plane' do

    let(:gatwick) { Airport.new(5) }
    let(:boeing747) { Plane.new }
    let(:boeing777) { Plane.new }
    let(:dublin) { double(Airport, weather: 'stormy') }


    it 'removes a plane from the hangar' do
      gatwick.land_plane(boeing747)
      gatwick.take_off_plane(boeing747)
      expect(gatwick.hangar).to eq []
    end

    it 'removes a specific plane from the hangar' do
      gatwick.land_plane(boeing747)
      gatwick.land_plane(boeing777)
      gatwick.take_off_plane(boeing747)
      expect(gatwick.hangar).to eq [boeing777]
    end

    it 'prevents takeoff when the weather is stormy' do
      allow(dublin).to receive(:land_plane)
      allow(dublin).to receive(:take_off_plane)
      dublin.land_plane(boeing747)
      dublin.take_off_plane(boeing747)
      expect { dublin.take_off_plane(boeing747) }.to raise_error "You cannot take off whilst the weather is stormy"
    end
  end
end
