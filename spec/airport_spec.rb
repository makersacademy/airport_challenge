require 'airport'

describe Airport do


  it 'creates an instance of the Aiport class' do
    airport = Airport.new
    expect(airport).to be_instance_of(Airport)
  end

  it { is_expected.to respond_to(:land_plane).with(2).arguments }

  it { is_expected.to respond_to(:take_off).with(2).arguments }

  it { is_expected.to respond_to(:full?) }

  it "has a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#land_plane' do
    let(:plane) { double :plane }
    let(:weather) { double :weather }
    it 'lands plane when good weather' do
      # allow(plane).to receive(:in_air).and_return(true)
      # allow(weather).to receive(:stormy?).and_return(true)
      plane = double(:plane, in_air?: true)
      weather = double(:weather, stormy?: false)
      plane.in_air?
      weather.stormy?
      expect(subject.land_plane(plane, weather)).to include(plane)
    end

    let(:plane) { double :plane }
    let(:weather) { double :weather }
    it 'raises an error when airport is full' do
      plane = double(:plane, in_air?: true)
      weather = double(:weather, stormy?: false)
      plane.in_air?
      weather.stormy?
      subject.capacity.times { subject.land_plane(plane, weather) }
      expect { subject.land_plane(:plane, :weather) }.to raise_error "airport is full"
    end

    let(:plane ) { double :plane }
    let(:weather) { double :weather }
    it 'raises an error when trying to land a plane in stormy weather' do
      # allow(plane).to receive(:in_air).and_return(true)
      # allow(weather).to receive(:stormy?).and_return(true)
      plane = double(:plane, in_air?: true)
      weather = double(:weather, stormy?: true)
      plane.in_air?
      weather.stormy?
      expect { subject.land_plane(plane, weather) }.to raise_error 'cannot land: stormy_weather'
    end

    let(:plane) { double :plane }
    let(:weather) { double :weather }
    it 'raises an error when trying to land a grounded plane' do
      # allow(plane).to receive(:in_air).and_return(true)
      # allow(weather).to receive(:stormy?).and_return(true)
      plane = double(:plane, in_air?: false)
      weather = double(:weather, stormy?: false)
      plane.in_air?
      weather.stormy?
      expect { subject.land_plane(plane, weather) }.to raise_error 'plane already grounded'
    end

  end

  describe '#take_off' do
  #   let(:plane) { double :plane }
  #   it 'allows a plane to leave the airport to take off' do
  #     expect(subject.take_off(plane, weather)).to be plane
  #   end

    let(:plane) { double :plane }
    let(:weather) { double :weather }
    it 'raises an error when trying to take-off in stormy weather' do
      # allow(plane).to receive(:in_air).and_return(true)
      # allow(weather).to receive(:stormy?).and_return(true)
      #plane = double(:plane, in_air?: false)
      weather = double(:weather, stormy?: true)
      weather.stormy?
      expect { subject.take_off(plane, weather) }.to raise_error 'cannot take-off: stormy_weather'
    end
  end


end
