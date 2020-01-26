require 'airport'

# my second test - checks if class exists
describe Airport do
  it 'checks if airport exists' do
    expect(subject).to be_a Airport
  end

# my third test - checks if the class Airport responds to the method land_plane
  it 'responds to land_plane' do
    expect(subject).to respond_to :land
  end 
# one line syntax: it {is_expected.to respond_to :land}

  it { should respond_to(:land).with(2).arguments } 

  it { should respond_to(:take_off).with(1).arguments }

  it 'stores a plane when landed' do
    plane = Plane.new
    sunny_weather = double(Weather, stormy?: false)
    expect(subject.land(plane, sunny_weather)).to eq([plane])
  end

  it 'removes a plane when landed' do
    plane = Plane.new
    sunny_weather = double(Weather, stormy?: false)
    subject.land(plane, sunny_weather)
    expect(subject.take_off(sunny_weather)).to eq(plane)
  end

  it 'has a deafult capacity' do 
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end 

  describe '#land' do 
    it 'raises an error to stop landing when airport is full' do
      sunny_weather = double(subject, stormy?: false)
      subject.capacity.times { subject.land(Plane.new, sunny_weather) }
      expect { subject.land(Plane.new, sunny_weather) }.to raise_error "No space to land"
    end
  end

  describe 'initialization' do
    subject { Airport.new }
    let(:plane) { Plane.new }
    
    it 'defaults capacity' do
      sunny_weather = double(subject, stormy?: false)
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane, sunny_weather)
      end

      expect { subject.land(plane, sunny_weather) }.to raise_error 'No space to land'
    end
  end

  describe '#take_off' do
    it 'stops take off when weather is stormy' do
      sunny_weather = double(subject, stormy?: false)
      plane = Plane.new
      subject.land(plane, sunny_weather)  

      stormy_weather = double(subject, stormy?: true)
      expect { subject.take_off(stormy_weather) }.to raise_error "weather is stormy, unable to take off"
    end
    
     # above created a double; fake weather that was stormy 

    it 'allows takes off when weather is sunny' do
      plane = Plane.new
      
      # land plane in good weather
      sunny_weather = double(subject, stormy?: false)
      subject.land(plane, sunny_weather)

      expect(subject.take_off(sunny_weather)).to eq(plane)
    end
  end

  describe "#land" do
    it 'prevents landing when weather is stormy' do
      plane = Plane.new
      stormy_weather = double(subject, stormy?: true)
      expect { subject.land(plane, stormy_weather) }.to raise_error "weather is stormy, do not land"
    end

    it 'allows landing when weather is sunny' do
      plane = Plane.new
      sunny_weather = double(subject, stormy?: false)
      subject.land(plane, sunny_weather)
      expect(subject.take_off(sunny_weather)).to eq(plane)
    end
  end
end 

# dont land if weather = stormy
