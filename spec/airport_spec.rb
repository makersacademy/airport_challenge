require 'airport.rb'
require 'plane.rb'

describe Airport do

  it { is_expected.to respond_to :land }

  describe '#take_off' do
    it 'tells us the plane is on route' do
      subject.take_off(Plane.new)
      expect(subject.take_off Plane.new).to eq 'Plane on route!'
    end
  end
  describe '#land' do
    it 'prevents landing when airport is full' do
    expect { subject.land(plane) }.to raise_error 'Airport full!'
    end
  end

end


# describe '#dock'do
#   it 'raises an error when full' do
#     subject.capacity.times{ subject.dock Bike.new }
#     expect { subject.dock Bike.new }.to raise_error 'Docking station full'
#   end
# end

#20.times {subject.dock Bike.new}
#       #DockingStation::DEFAULT_CAPACITY.times do
