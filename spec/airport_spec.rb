require 'airport'

describe Airport do

  subject(:airport) {described_class.new}

  let(:landed_plane) {double(:landed_plane, landed?: true)}
  let(:flying_plane) {double(:flying_plane, landed?: false)}

  before {allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)}


  describe 'attributes:' do
    it { is_expected.to have_attributes(planes: []) }
    it { is_expected.to have_attributes(capacity: Airport::DEFAULT_CAPACITY) }
  end

  describe '#land_plane' do
    it 'lands a plane' do
      airport.land_plane(flying_plane)
      expect(airport.planes[-1]).to eq flying_plane
    end

    it 'return confimation message once landed' do
      expect(airport.land_plane(flying_plane)).to eq 'The plane has landed!'
    end

    it 'raises error if airport is full' do
      Airport::DEFAULT_CAPACITY.times {airport.land_plane(flying_plane)}
      expect {airport.land_plane(flying_plane)}.to raise_error 'The airport is full!'
    end

    it 'raises error if weather is stormy' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
      expect{airport.land_plane(flying_plane)}.to raise_error 'Land Denied: Storm!'
    end
  end


  describe '#take_off_plane' do
    it 'takes off plane' do
      airport.planes << landed_plane
      airport.take_off_plane(landed_plane)
      expect(airport.planes).to eq []
    end

    it 'returns confirmation message once taken off' do
      airport.planes << landed_plane
      expect(airport.take_off_plane(landed_plane)).to eq 'The plane has taken off!'
    end

    it "raises error if the airport is empty" do
      expect{airport.take_off_plane(landed_plane)}.to raise_error 'The airport is empty!'
    end

    it 'raises error if plane has already taken off' do
      expect{airport.take_off_plane(flying_plane)}.to raise_error 'This plane has already taken off!'
    end

    it 'raises error if weather is stormy' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
      airport.planes << landed_plane
      expect{airport.take_off_plane(landed_plane)}.to raise_error 'Take off Denied: Storm!'
    end
  end
end
