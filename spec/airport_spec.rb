require 'airport'

describe Airport do

  let(:plane) {double(:plane)}

  describe 'initialize' do

    it 'initializes with a default capacity' do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

    it 'initializes with variable capacity' do
      pending('variable capacity')
      airport = Airport.new 49
      expect {airport.capcity}.to eq 49
    end
  end

  describe 'instructing plane' do



    it 'instructs plane to take_off' do
    end
  end

  describe 'confirming plane states' do
    it 'requests plane to confirm landing' do
    end

    it 'requests plane to confirm take-off' do
    end
  end


end

=begin

it 'instructs plane to land' do
  allow(plane).to receive(:to_land)
  expect(plane).to respond_to(:to_land)
  subject.instruct_land(plane)
end
=end
