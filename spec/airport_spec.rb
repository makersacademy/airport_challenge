require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it { is_expected.to respond_to(:takeoff_plane) }
  it { is_expected.to respond_to(:regenerate_weather) }
  let(:flying_plane) { double :plane, :state => 'Flying', :state= => :state, :flying? => :state }
  let(:stored_plane) { double :plane, :state => subject.airport_id, :state= => :state, :flying? => :state }

  it 'generates weather on instantiation' do
    expect(subject.local_weather).to eq('Sunny').or eq('Stormy')
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  it 'has a variable capacity' do
    my_airport = Airport.new(capacity: 10)
    allow(my_airport).to receive(:stormy?).and_return(false)
    # allow(bike).to receive(:dock).and_return(:bike)
    # my_airport.local_weather = 'Sunny'
    10.times { my_airport.land_plane(flying_plane) }
    expect { my_airport.land_plane(flying_plane) }.to raise_error 'The Airport is full'
  end

  describe '#land_plane' do
    it 'stores planes' do
      subject.local_weather = 'Sunny'
      expect(subject.land_plane(flying_plane)).to eq flying_plane
    end
    it 'raises error if weather is stormy' do
      subject.local_weather = 'Stormy'
      # allow(subject).to receive(:rand) {"stormy"} <---
      expect { subject.land_plane(flying_plane) }.to raise_error 'The Stormy weather prevents landing'
    end
    it 'raises error if @planes is full' do
      subject.local_weather = 'Sunny'
      subject.capacity.times { subject.land_plane(flying_plane) }
      expect { subject.land_plane(flying_plane) }.to raise_error 'The Airport is full'
    end
    it 'raises error if plane state != flying' do
      subject.local_weather = 'Sunny'
      allow(stored_plane).to receive(:flying?).and_return(false)
      expect { subject.land_plane(stored_plane) }.to raise_error 'A plane cannot land if it is not flying'
    end
  end

  describe '#takeoff_plane' do
    it 'releases planes' do
      subject.local_weather = 'Sunny'
      subject.land_plane(flying_plane)
      allow(flying_plane).to receive(:state).and_return(subject.airport_id)
      expect(subject.takeoff_plane).to eq 'Plane has taken off'
    end
    it 'does not release planes when no planes are stored' do
      expect { subject.takeoff_plane }.to raise_error 'No planes available for takeoff'
      subject.local_weather = 'Sunny'
      subject.land_plane(flying_plane)
      allow(flying_plane).to receive(:state).and_return(subject.airport_id)
      subject.takeoff_plane
      expect { subject.takeoff_plane }.to raise_error 'No planes available for takeoff'
    end
    it 'raises error if weather is stormy' do
      subject.local_weather = 'Sunny'
      subject.land_plane(flying_plane)
      subject.local_weather = 'Stormy'
      expect { subject.takeoff_plane }.to raise_error 'The Stormy weather prevents takeoff'
    end
    it 'only release planes stored at itself' do
      subject.local_weather = 'Sunny'
      subject.land_plane(flying_plane)
      flying_plane.state = 'Flying'
      expect { subject.takeoff_plane }.to raise_error 'Only locally stored planes can takeoff'
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
