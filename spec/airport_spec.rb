require_relative '../lib/airport.rb'

describe Airport do

  describe "#dock_plane" do
  it { is_expected.to respond_to(:dock_plane).with(1).argument }

    it 'should allow a plane to land if airport is not full' do
      plane = Plane.new
      plane.land 

    end 
    
    it 'prevents landing when airport is full' do
      #??
    end

  end

end