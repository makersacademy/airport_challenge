require "./lib/airport.rb"
require "./lib/airplane.rb"

describe Airport do
  describe '#land' do
    it 'responds to the instruction to land a plane' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'instructs the plane to #land' do
      airplane = Airplane.new
      #subject.land(airplane)
      expect(subject.land(airplane)).to eq [airplane]
    end
    
    it 'raises an error when full' do
      subject.capacity.times { subject.land Airplane.new }
      expect { subject.land Airplane.new }.to raise_error 'The airport is full'
    end
  end

  describe '#take_off' do
    it 'responds to the instruction to take off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'instructs the plane #to take_off' do
      airplane = Airplane.new
      subject.land(airplane)
      expect(subject.take_off(airplane)).to eq airplane
    end

    it 'raises an error when there are no planes in land' do
      expect { subject.take_off Airplane.new }.to raise_error 'The airport is empty'
    end

    #it 'raises an error when the weather is stormy' do
    #  expect { subject.take_off(airplane) }.to raise_error 'Too stormy to takeoff'
    #end
  end

  #describe 'empty' do
  #  it 'raises error if airport is empty' do
  #    subject.capacity.times { subject.land Airplane.new }
  #    expect { subject.land Airplane.new }.to raise_error 'Airport is full'
  #  end
  #end

  #it 'has a default capacity' do
  #  expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  #end 

end

=begin
require './docs/airport.rb'

describe Airport do

  describe '#land_plane' do
    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe '#take_off' do
    it 'takes off' do
      plane = Plane.new
      expect(subject.takeoff(plane)).to eq [plane]
    end
  end

  describe 'full' do
    it 'raises error if airport is full' do
      subject.capacity.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error 'Airport full'
    end
  end

  describe 'empty' do
    it 'raises error if airport is empty' do
      subject.capacity.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error 'Airport full'
    end
  end
end


=end