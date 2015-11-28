require_relative '../lib/airport.rb'
require_relative '../lib/plane.rb'
describe Airport do

  describe 'Default Capacity with Override' do
    it 'checks Airport(class) exists (is Airport == true)' do
      expect(Airport).to be
    end

    it 'Airport has a DEFAULT_CAPACITY(constant)' do
      expect(Airport::DEFAULT_CAPACITY).to be
    end

    it 'Airport has a DEFAULT_CAPACITY == 20 ' do
      expect(Airport::DEFAULT_CAPACITY).to eq(20)
    end

    it 'Airport has a default capacity attribute(instance_variable)' do
      expect(Airport.new).to have_attributes(:default_capacity => 20)
    end

    it '[KEY BEHAVIOUR]Airport has a default capacity & can be over-ridden' do
      expect(Airport.new(30).instance_variable_get(:@default_capacity)).
        to eq(30)
    end

  end

  describe 'Planes at Airport' do
    it 'Airport planes attr @planes exists' do
      expect(Airport.new.instance_variable_get(:@planes)).to be
    end

    it 'Airport can store/accept planes as array' do
      expect(Airport.new.instance_variable_get(:@planes).class.name).
        to eq('Array')
    end

  end

  describe 'Landing behaviour' do

    it 'Airport method instruct_plane_to_land exists' do
      expect(Airport.new).to respond_to(:instruct_plane_to_land)
    end

    it 'instruct_plane_to_land exists takes Plane as argument' do
      expect(Airport.new).to respond_to(:instruct_plane_to_land).
        with(1).arguments
    end

    it 'planes in flight attribute/state can be changed to false(landed)' do
      a = Airport.new
      plane = Plane.new
      a.instruct_plane_to_land(plane)
      expect(plane.instance_variable_get(:@plane_in_flight)).to eq "Landed"
    end

    it 'once plane has landed it is in airport @planes array' do
      a = Airport.new
      plane = Plane.new
      a.instruct_plane_to_land(plane)
      expect(a.instance_variable_get(:@planes)).to eq [plane]
    end

    it 'confirmation message on landing' do
      a = Airport.new
      plane = Plane.new
      expect {a.instruct_plane_to_land(plane)}.
        to output("Plane: #{plane} has landed. Status: Landed\n").to_stdout
    end

    it '[Key Behaviour] Refuse landing if airport full' do
      a = Airport.new
      plane = Plane.new
      20.times { a.instruct_plane_to_land(Plane.new) }
      expect {a.instruct_plane_to_land(plane)}.
        to raise_error("Airport full: Landing Denied")
    end
  end

  describe 'Taking Off' do

    it 'Airport method instruct_plane_to_take_off exists' do
      expect(Airport.new).to respond_to(:instruct_plane_to_take_off)
    end

    it 'instruct_plane_to_take_off exists takes Plane as argument' do
      expect(Airport.new).to respond_to(:instruct_plane_to_take_off).
        with(1).arguments
    end

    it 'airport can tell @plane_in_flight to be changed to In-Flight' do
      a = Airport.new
      plane = Plane.new
      a.instruct_plane_to_land(plane)
      a.instruct_plane_to_take_off(plane)
      expect(plane.instance_variable_get(:@plane_in_flight)).to eq "In-Flight"
    end

    it 'once plane has taken off is not in airport (@planes array)' do
      a = Airport.new
      plane = Plane.new
      a.instruct_plane_to_land(plane)
      a.instruct_plane_to_take_off(plane)
      expect(a.instance_variable_get(:@planes)).not_to include(plane)
    end

    it 'confirmation message on take off' do
      a = Airport.new
      plane = Plane.new
      a.instruct_plane_to_land(plane)
      expect {a.instruct_plane_to_take_off(plane)}.
        to output("Plane: #{plane} has departed. Status: In-Flight\n").to_stdout
    end
  end

end
