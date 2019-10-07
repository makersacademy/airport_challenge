require 'spec_helper'
require 'airport'

describe Airport do

  let(:plane) {double :plane}

  it '' do
    expect(Airport).to receive(:new).with(10)
    airport = Airport.new(10)
    # expect(airport.planes).to eq(10)
  end

  it 'defines the capacity, planes and weather stormy arrays and variables.' do
     airport = described_class.new(6)
    expect(airport.capacity).to eq(6)
    expect(airport.planes).to eq([])
    expect{ raise airport.weather_stormy?}.to raise_error NoMethodError
  end

  describe '#add_plane' do

    it {is_expected.to respond_to(:add_plane)}

    it 'will receive plane as argument' do
      is_expected.to receive(:add_plane).with(plane)
      subject.add_plane(plane)
    end

    it 'confirms a plane is in the airport after it lands' do
      subject.add_plane(plane)
      expect(subject.planes).to include(plane)
    end

    it 'wont allow a plane to land if weather is too stormy' do
      subject.weather_is_stormy
      expect { raise subject.add_plane(plane)}.to raise_error 'weather is too stormy for landing'
    end

    it 'wont allow a plane to land if airport is full' do
      (subject.capacity).times { subject.add_plane(plane) }
      expect {raise subject.add_plane(plane)}.to raise_error 'airport is full so plane cannot land'
    end

  end

  describe '#remove_plane' do

    it 'confirms a plane is not in the airport after take off' do
      subject.add_plane(plane)
      subject.remove_plane(plane)
      expect(subject.planes).not_to include(plane)
    end

    it 'wont remove a plane if weather is stormy' do
      subject.add_plane(plane)
      subject.weather_is_stormy
      expect { raise subject.remove_plane(plane)}.to raise_error 'weather is too stormy for take off'
    end

  end

  describe '#planes' do

    it {is_expected.to respond_to(:planes)}

  end

  describe '#capacity' do

    it {is_expected.to respond_to(:capacity)}

    it 'has default capacity of 20' do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

    it 'can overide the default capacity' do
      capacity = Random.rand(100)
      airport = described_class.new(capacity)
      expect(airport.capacity).to eq(capacity)
    end

  end

end
