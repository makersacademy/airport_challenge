require 'airport.rb'
require 'plane.rb'

describe Airport do

  it { is_expected.to respond_to(:land_plane) }
  it { is_expected.to respond_to(:take_off_plane) }

  describe 'land_plane' do

    let(:gatwick) { Airport.new }
    let(:boeing747) { double :plane }
    let(:boeing777) { double :plane }
    let(:dublin) { Airport.new }

    before 'a group of tests that have a plane in the hangar and the weather is sunny' do
      gatwick.instance_variable_set(:@weather, :sunny)
      gatwick.land_plane(boeing747)
    end

    it 'adds a plane to the airport hangar' do
      expect(gatwick.hangar).to eq [boeing747]
    end

    it 'adds a plane to an airport hangar that already has a plane in it' do
      gatwick.land_plane(boeing777)
      expect(gatwick.hangar).to eq [boeing747, boeing777]
    end

    it 'will only allow a plane to land if there is space' do
      expect { (Airport::DEFAULT_CAPACITY + 1).times { gatwick.land_plane(Plane.new) } }.to raise_error "There is no space in the hangar"
    end

    it 'will only allow a plane to land if there is space and the capacity has been changed' do
      luton = Airport.new(17)
      luton.instance_variable_set(:@weather, :sunny)
      expect { 18.times { luton.land_plane(Plane.new) } }.to raise_error "There is no space in the hangar"
    end

    it 'raises an error if the weather is stormy' do
      dublin.instance_variable_set(:@weather, :stormy)
      expect { dublin.land_plane(boeing747) }.to raise_error "It is too stormy to land"
    end
  end

  describe 'take_off_plane' do

    let(:gatwick) { Airport.new(5) }
    let(:boeing747) { double :plane }
    let(:boeing777) { double :plane }
    let(:dublin) { Airport.new(5) }

    before 'a group of tests with sunny weather and a plane in the hangar' do
      gatwick.instance_variable_set(:@weather, :sunny)
      gatwick.land_plane(boeing747)
      dublin.instance_variable_set(:@weather, :sunny)
    end

    it 'removes a plane from the hangar if weather is sunny' do
      gatwick.take_off_plane(boeing747)
      expect(gatwick.hangar).to eq []
    end

    it 'removes a specific plane from the hangar if weather is sunny' do
      gatwick.land_plane(boeing777)
      gatwick.take_off_plane(boeing747)
      expect(gatwick.hangar).to eq [boeing777]
    end

    it 'it raises an error if the plane is not in the hangar' do
      expect { gatwick.take_off_plane(boeing777) }.to raise_error "That plane is not in the hangar"
    end

    it 'prevents takeoff when the weather is stormy' do
      dublin.land_plane(boeing747)
      dublin.instance_variable_set(:@weather, :stormy)
      expect { dublin.take_off_plane(boeing747) }.to raise_error "You cannot take off whilst the weather is stormy"
    end

  end
end
