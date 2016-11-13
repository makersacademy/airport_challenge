require 'airport'

describe Airport do

  it "gets a plane" do
    expect(subject.get_plane).to be_kind_of Plane
  end

  it 'responds to .plane' do
    expect(subject).to respond_to :plane
  end

  context 'when landing and taking off planes' do

    before(:each) do
      @plane = Plane.new
      sunny_weather = instance_double("Weather", :condition => :sunny)
      subject.set_weather(sunny_weather)
      subject.land(@plane)
    end

    it 'lands a Plane and returns the same Plane' do
      expect(subject.plane).to eq @plane
    end

    it 'can take off a plane' do
      subject.take_off_plane
      expect(subject.plane).to eq nil
    end

  end

  context '#weather' do

    it 'contains a Weather object' do
      expect(subject.weather).to be_kind_of Weather
    end

    it 'can overwrite its weather attribute' do
      weather = Weather.new
      subject.set_weather(weather)
      expect(subject.weather).to eq weather
    end

  end

  describe "error handling" do

    context 'when there is stormy weather' do

      before(:each) do
        stormy_weather = instance_double("Weather", :condition => :stormy)
        subject.set_weather(stormy_weather)
      end

      it 'does not allow Planes to take off' do
        message = 'Planes cannot take off while it is stormy'
        expect { subject.take_off_plane }.to raise_error(RuntimeError, message)
      end

      it 'does not allow Planes to land' do
        message = 'Planes cannot land while it is stormy'
        expect { subject.land(Plane.new) }.to raise_error(RuntimeError, message)
      end

    end

    describe 'when airport capacity is full' do

      it 'does not allow planes to land' do
        sunny_weather = instance_double("Weather", :condition => :sunny)
        subject.set_weather(sunny_weather)
        message = 'Planes cannot land at this airport, it is full'
        subject.land(Plane.new)
        expect { subject.land(Plane.new) }.to raise_error(RuntimeError, message)
      end

    end

  end

end
