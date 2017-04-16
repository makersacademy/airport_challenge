require './lib/airport.rb'

describe Airport do 

  describe "#land a plane" do

    it 'lands a plane when a plane is passed' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'finds the plane that has been landed' do
      plane = Plane.new
      expect(subject.land(plane)).to eq subject.planes
    end

  end

end
