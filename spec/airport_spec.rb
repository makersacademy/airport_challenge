require 'airport.rb'
require 'airplane.rb'
require 'weather.rb'
describe LHRairport do
  it 'instruct a plane to land in airport' do
    expect(subject).to respond_to :land_plane
  end
  it  'instruct a plane to take off from the airport' do
    expect(subject).to respond_to :depart_plane
  end
  describe '#land_plane' do
    it 'raises an error when Airport is full' do
      10.times { subject.land_plane Airplane.new }
      expect { subject.land_plane Airplane.new }.to raise_error 'Airport is full'
    end
  end

end
