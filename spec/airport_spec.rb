require './lib/airport.rb'

describe Airport do
 describe '#initialization' do
  subject { Airport.new }
  let(:plane) { Plane.new }
  it 'defaults the capacity for airport' do
    described_class::DEFAULT_CAPACITY.times do
      subject.land_plane(plane)
    end 
    expect { subject.land_plane(plane) }.to raise_error 'The airport is full'
  end 
 end

 describe '#take_off' do
   it { is_expected.to respond_to(:take_off) }
 end

 describe '#land_plane' do
  it { is_expected.to respond_to :land_plane }  
  it 'raises an error if airport full' do
   5.times { subject.land_plane Plane.new }
   expect { subject.land_plane Plane.new }.to raise_error 'The airport is full'
  end 
 end
end 
