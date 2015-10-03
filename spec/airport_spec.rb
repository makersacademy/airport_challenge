require 'airport'
require 'weather'
require'plane'


describe Airport do

    let(:double_plane){double :plane, flying: 'flying'}
    let(:double_weather) {double :weather, false }

    it { is_expected.to respond_to :planes }
    it { is_expected.to respond_to :count_planes }
    it { is_expected.to respond_to :now_weather }


    it 'has a capacity with a maximum number of planes' do
      expect(subject.capacity).to eql 5
    end


    it 'should allow a plane to land' do
      glasgow = Airport.new
      allow(glasgow).to receive(:now_weather) {'sunny'}
      allow(double_plane).to receive(:land)
      glasgow.clear_to_land(double_plane)
      expect(glasgow.planes.count).to eql(1)
    end

    it 'should allow a plane to take off' do
      glasgow = Airport.new
      allow(glasgow).to receive(:now_weather) {'sunny'}
      allow(double_plane).to receive(:land)
      glasgow.clear_to_land(double_plane)
      allow(glasgow).to receive(:now_weather) {'sunny'}
      allow(double_plane).to receive(:take_off)
      glasgow.clear_to_take_off(double_plane)
      expect(glasgow.planes.count).to eql(0)
    end

    it 'should prevent a plane from landing if the airport is full' do
      glasgow = Airport.new
      allow(glasgow).to receive(:now_weather) {'sunny'}
      allow(double_plane).to receive(:land)
      5.times {glasgow.clear_to_land(double_plane)}
      expect {glasgow.clear_to_land(double_plane)}.to raise_error 'Airport at Capacity'
    end

    context 'when weather conditions are stormy' do

    it 'the bad weather does not allow a plane to take off' do
      glasgow = Airport.new
      allow(glasgow).to receive(:now_weather) {'sunny'}
      allow(double_plane).to receive(:land)
      glasgow.clear_to_land(double_plane)
      allow(glasgow).to receive(:now_weather) {'stormy'}
      expect{ glasgow.clear_to_take_off(double_plane) }.to raise_error 'Stormy!'
    end

    it 'the bad weather does not allow a plane to land' do
      glasgow = Airport.new
      allow(glasgow).to receive(:now_weather) {'stormy'}
      allow(double_plane).to receive(:land)
      expect{ glasgow.clear_to_land(double_plane) }.to raise_error 'Stormy!'
    end

  end




end
