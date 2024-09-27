require 'airport'
require 'plane'
require 'weather'

describe Airport do
  it 'instructs to land plane' do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it 'instructs plane to takeoff' do
    expect(subject).to respond_to :takeoff_plane
  end


  describe '#takeoff_plane' do
    it 'takes off a plane' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.takeoff_plane).to eq plane
    end

    it 'raises an error to prevent plane taking off due to stormy weather' do
      allow(subject).to receive(:weather?).and_return(true)
      expect(subject.takeoff_plane).to raise_error 'Plane cannot takeoff in stormy weather'
    end

    it 'raises an error when there are no planes at the airport' do
      expect { subject.takeoff_plane }.to raise_error 'No planes at the airport'
    end
  end

  describe '#land_plane' do
    it 'raises a message when airport is full' do
      subject.capacity.times do 
        subject.land_plane(Plane.new)
      end

    # it 'raises an error to prevent plane from landing due to stormy weather' do
    #   allow(subject).to receive(:weather?).and_return(true)
    #   expect { subject.land_plane(Plane.new) }.to raise_error 'Plane cannot land in stormy weather'
    # end

      expect { subject.land_plane Plane.new }.to raise_error 'Airport is full'
    end
  end

  # describe 'initialisation' do
  #   it 'has a variable capacity' do
  #     airport = Airport.new(20)
  #     20.times { airport.land_plane Plane.new }
  #     expect{ airport.land_plane Plane.new }.to raise_error 'Airport is full'
  #   end
  # end
  
end