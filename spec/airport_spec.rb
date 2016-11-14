require "airport"
require 'weather'

describe Airport do

  context '#receive_plane' do

  let(:weather) { double('weather', :current_weather => :sunny)}

    before(:each) do
      @plane = Plane.new
      @plane2 = Plane.new
      subject.receive_plane(@plane, weather)
      subject.receive_plane(@plane2, weather)
    end

    it 'Can recieve a plane at the airport' do
      expect(subject.planes.shift).to eq @plane
    end

    it 'The airport can receive more than one plane' do
      expect(subject.planes).to include(@plane, @plane2)
    end
  end

  context '#take_off' do

    let(:weather) { double('weather', :current_weather => :sunny)}

    before(:each) do
      @plane = Plane.new
      subject.receive_plane(@plane, weather)
    end

    it 'Orders planes to take off from the airport' do
      expect(subject.take_off(@plane, weather)).to be_kind_of(Plane)
    end
  end

  context '#empty? or #full?' do

    let(:weather) { double('weather', :current_weather => :sunny)}

    before(:each) do
      @plane = Plane.new
    end

    it 'Returns true if the airport is empty' do
      expect(subject.is_empty?).to eq true
    end

    it 'Returns false if the airport is not empty' do
      subject.receive_plane(@plane, weather.current_weather)
      expect(subject.is_empty?).to eq false
    end

    it 'Returns true if the airport is full' do
      subject.capacity.times {subject.receive_plane(@plane, weather.current_weather)}
      expect(subject.is_full?).to eq true
    end

    it 'Returns false if the airport is not full and below full capacity' do
      expect(subject.is_full?).to eq false
    end
  end

  context 'stormy weather' do

    before(:each) do
      @plane = Plane.new
    end

    let(:weather) { double('weather', :current_weather => :stormy)}

    it 'Raises error if a plane tries to land in stormy weather' do
      expect { subject.receive_plane(@plane, weather.current_weather) }.to raise_error('Weather is stormy, cannot land at airport')
    end

    it 'Raises error if plane tries to take off in stormy weather' do
      expect { subject.take_off(@plane, weather.current_weather) }.to raise_error('Weather is stormy, cannot take off from airport')
    end
  end


  context 'error handling' do

    let(:weather) { double('weather', :current_weather => :sunny)}

    before(:each) do
      @plane = Plane.new
    end

    it 'Raises and error if you try to land a plane when the airport is full' do
      subject.capacity.times {subject.receive_plane(@plane, weather.current_weather)}
      expect { subject.receive_plane(@plane, weather.current_weather) }.to raise_error('Airport is full, no landing this time')
    end

    it 'Raises an error if you try to ask a plane to take off but there are no planes' do
      expect { subject.take_off(@plane, weather.current_weather) }.to raise_error('The airport is empty, no planes to take off')
    end
  end
end
