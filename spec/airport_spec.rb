require 'airport'
require 'plane'
require 'weather'

describe Airport do
  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it { is_expected.to respond_to(:takeoff_plane) }
  it { is_expected.to respond_to(:regenerate_weather) }
  
  it 'generates weather on instantiation' do
    expect(subject.local_weather).to eq('Sunny').or eq('Stormy')
  end

  describe '#land_plane' do
    plane = Plane.new
    it 'stores planes' do
      subject.local_weather = 'Sunny'
      expect(subject.land_plane(plane)).to eq plane
    end
    it 'raises error if weather is stormy' do
      subject.local_weather = 'Stormy'
      expect { subject.land_plane(plane) }.to raise_error 'The Stormy weather prevents landing'
    end
    it 'raises error if @planes is full' do
      subject.local_weather = 'Sunny'
      1.times { subject.land_plane(Plane.new) }
      expect { subject.land_plane(Plane.new) }.to raise_error 'The Airport is full'
    end
  end

  describe '#takeoff_plane' do
    plane = Plane.new
    it 'releases planes' do
      subject.local_weather = 'Sunny'
      subject.land_plane(plane)
      expect(subject.takeoff_plane).to eq 'Plane has taken off'
    end
    it 'does not release planes when no planes are stored' do
      expect { subject.takeoff_plane }.to raise_error 'No planes available for takeoff'
      subject.local_weather = 'Sunny'
      subject.land_plane(plane)
      subject.takeoff_plane
      expect { subject.takeoff_plane }.to raise_error 'No planes available for takeoff'
    end
    it 'raises error if weather is stormy' do
      subject.local_weather = 'Sunny'
      subject.land_plane(plane)
      subject.local_weather = 'Stormy'
      expect { subject.takeoff_plane }.to raise_error 'The Stormy weather prevents takeoff'
    end
  end

  describe '#regenerate_weather' do
    it 'changes the local_weather object' do
      x = subject.local_weather
      subject.regenerate_weather
      y = subject.local_weather
      expect(x.object_id).not_to be(y.object_id)
    end
  end
end
