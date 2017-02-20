require 'airport'
require 'weather'

describe Airport do

  context 'good weather' do

  let(:weather) { double('weather', :current_weather => :fine)}
  before(:each) do
    @plane = Plane.new
  end

    it { is_expected.to respond_to :take_off }

    it 'Lands a plane' do
      expect(subject.lands_plane(@plane, weather.current_weather)).to eq subject.planes
    end

    # it 'Lets plane to take off' do
    #   expect(subject.take_off(@plane, weather.current_weather)).to eq false #take_off is actually self.land hence equals false here
    # end
  end

  context 'bad weather' do

    let(:weather) { double('weather', :current_weather => :stormy)}
    before(:each) do
      @plane = Plane.new
    end

    it 'Raises error if a plane tries to land in storm' do
      expect { subject.lands_plane(@plane, weather.current_weather) }.to raise_error("Cannot land at airport due to adverse weather conditions")
    end

    it 'Raises error if a plane tries to take off in storm' do
      expect{ subject.take_off(@plane, weather.current_weather) }.to raise_error("Cannot take off from airport due to adverse weather conditions")
    end
  end

    context 'capacity' do

      let(:weather) { double('weather', :current_weather => :fine)}
      before(:each) do
        @plane = Plane.new
      end

      it 'Returns true if airport is full' do
        subject.capacity.times {subject.lands_plane(@plane, weather.current_weather)}
        expect(subject.is_full?).to eq true
      end

      it 'Raises an error if landing is requested when airport is full' do
        subject.capacity.times {subject.lands_plane(@plane, weather.current_weather)}
        expect { subject.lands_plane(@plane, weather.current_weather) }.to raise_error("Airport is full, no landing")
    end
  end
end
