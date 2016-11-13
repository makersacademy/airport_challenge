require 'airport'

describe Airport do

  it "gets a plane" do
    expect(subject.get_plane).to be_kind_of Plane
  end

  it 'responds to .planes' do
    expect(subject).to respond_to :planes
  end

  it 'responds to .is_full?' do
    expect(subject).to respond_to :is_full?
  end

  it 'responds to .is_stormy?' do
    expect(subject).to respond_to :is_stormy?
  end

  describe '#capacity' do

    it 'has a capacity attribute' do
      expect(subject).to respond_to :capacity
    end

    it 'can be initialized with a capacity argument' do
      airport = Airport.new(30)
      expect(airport.capacity).to eq 30
    end

  end

  context 'when landing and taking off planes' do

    before(:each) do
      @plane = instance_double("Plane")
      @another_plane = instance_double("Plane")
      sunny_weather = instance_double("Weather", :condition => :sunny)
      subject.set_weather(sunny_weather)
      subject.land(@plane)
    end

    it 'lands a Plane and returns the same Plane' do
      expect(subject.planes.shift).to eq @plane
    end

    it 'can land more than one plane' do
      expect(subject.land(@another_plane)).to include(@plane, @another_plane)
    end

    it 'can take off a plane' do
      subject.take_off(@plane)
      expect(subject.planes).to eq []
    end

  end

  context '#weather' do

    it 'contains a Weather object' do
      expect(subject.weather).to be_kind_of Weather
    end

    it 'can overwrite its weather attribute' do
      weather = instance_double("Weather")
      subject.set_weather(weather)
      expect(subject.weather).to eq weather
    end

  end

  describe "error handling" do

    context 'when there is stormy weather' do

      before(:each) do
        stormy_weather = instance_double("Weather", :condition => :stormy)
        subject.set_weather(stormy_weather)
        @plane = instance_double("Plane")
      end

      it 'does not allow Planes to take off' do
        subject.planes << @plane
        message = 'Planes cannot take off while it is stormy'
        expect { subject.take_off(@plane) }.to raise_error(RuntimeError, message)
      end

      it 'does not allow Planes to land' do
        message = 'Planes cannot land while it is stormy'
        expect { subject.land(Plane.new) }.to raise_error(RuntimeError, message)
      end

    end

    context 'when it is sunny' do

      before(:each) do
        sunny_weather = instance_double("Weather", :condition => :sunny)
        subject.set_weather(sunny_weather)

      end

      describe 'when the airport is at capacity' do

        it 'does not allow planes to land when the airport is at capacity' do
          message = 'Planes cannot land at this airport, it is full'
          Airport::DEFAULT_CAPACITY.times { subject.land(instance_double("Plane")) }
          expect { subject.land(instance_double("Plane")) }.to raise_error(RuntimeError, message)
        end

      end

      context 'when there are inconsistent behaviours' do

        before(:each) do
          @plane = instance_double("Plane")
        end

        it 'only lets planes take off from airports they in' do
          message = 'This plane can\'t take off from here. It hasn\'t landed here.'
          expect{ subject.take_off(@plane) }.to raise_error(RuntimeError, message)
        end

        # it 'doesn\'t let planes that have landed land again' do
        #   message = 'That plane cannot land. It has already landed.'
        #   plane = Plane.new
        #   subject.land(plane)
        #   expect{ subject.land(plane) }.to raise_error(RuntimeError, message)
        # end

      end

    end

    # planes that are already flying cannot takes off
    # planes that are flying cannotbe in an airport;
    # planes that are landed cannot land again and must be in an airport, etc.

  end

end
