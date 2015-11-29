require_relative '../lib/airport.rb'

describe Airport do

  describe 'Default Capacity with Override' do
    it 'checks Airport(class) exists (is Airport == true)' do
      expect(subject).to be
    end

    it 'Airport has a DEFAULT_CAPACITY(constant)' do
      expect(Airport::DEFAULT_CAPACITY).to be
    end

    it 'Airport has a DEFAULT_CAPACITY that is type FixNum' do
      expect(Airport::DEFAULT_CAPACITY).to be_a_kind_of(Fixnum)
    end

    it 'Airport has a default capacity attribute(instance_variable)' do
      expect(subject).
        to have_attributes(:default_capacity => Airport::DEFAULT_CAPACITY)
    end

    it '[KEY BEHAVIOUR]Airport has a default capacity & can be over-ridden' do
      expect(Airport.new(30).instance_variable_get(:@default_capacity)).
        to eq(30)
    end

  end

  describe 'Planes at Airport' do

    it 'Airport planes attr @planes exists' do
      expect(subject.instance_variable_get(:@planes)).to be
    end

    it 'Airport can store/accept planes as array' do
      expect(subject.instance_variable_get(:@planes).class.name).
        to eq('Array')
    end

  end

  describe 'Landing behaviour' do

    it 'Airport method instruct_plane_to_land exists' do
      expect(subject).to respond_to(:instruct_plane_to_land)
    end

    it 'instruct_plane_to_land exists takes Plane as argument' do
      expect(subject).to respond_to(:instruct_plane_to_land).
        with(1).arguments
    end

    it 'once plane has landed it is in airport @planes array' do
      plane = (double(:Plane, :plane_landing => "Landed" ))
      a = Airport.new
      a.stub(:weather_check).and_return("sunny")
      a.instruct_plane_to_land(plane)
      expect(a.instance_variable_get(:@planes)).to eq [plane]
    end

    it 'confirmation message on landing' do
      a = Airport.new
      a.stub(:weather_check).and_return("sunny")
      plane = (double(:Plane, :plane_landing => "Landed"))
      expect {a.instruct_plane_to_land(plane)}.
        to output("Plane: #{plane} has landed.\n").to_stdout
    end

    it '[Key Behaviour] Refuse landing if airport full' do
      a = Airport.new
      plane = (double(:Plane,:plane_landing => "Landed"))
      a.stub(:weather_check).and_return("sunny")
      a.instruct_plane_to_land(plane)
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

    it 'once plane has taken off is not in airport (@planes array)' do
      a = Airport.new
      a.stub(:weather_check).and_return("sunny")
      plane = (double(:Plane, :plane_landing => "In-Flight"))
      a.instruct_plane_to_land(plane)
      plane = (double(:Plane, :plane_taking_off => "Landed"))
      a.instruct_plane_to_take_off(plane)
      expect(a.instance_variable_get(:@planes)).not_to include(plane)
    end

    it 'confirmation message on take off' do
      a = Airport.new
      a.stub(:weather_check).and_return("sunny")
      plane = (double(:Plane, :plane_landing => "Landed" ))
      a.instruct_plane_to_land(plane)
      plane = (double(:Plane, :plane_taking_off => "Landed" ))
      expect {a.instruct_plane_to_take_off(plane)}.
        to output("Plane: #{plane} has departed.\n").
          to_stdout
    end

  end

  describe 'weather check' do

    it 'weather method exists' do
      expect(subject.weather_check).to be
    end

    it 'returns a string' do
      expect(subject.weather_check.class).to be(String)
    end

    it 'raises error when take off attempted udner stormy conditions' do
      a = Airport.new
      plane = (double(:Plane,:plane_landing => "Landed"))
      a.instruct_plane_to_land(plane)
      a.stub(:weather_check).and_return("stormy")
      expect{a.instruct_plane_to_take_off(plane)}.to raise_error
    end

    it 'raises error when landing attempted udner stormy conditions' do
      a = Airport.new
      plane = (double(:Plane,:plane_landing => "Landed"))
      a.stub(:weather_check).and_return("stormy")
      expect{a.instruct_plane_to_land(plane)}.to raise_error
    end

  end

end
