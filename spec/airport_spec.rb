require 'airport.rb'

describe Airport do

  describe "#land" do
    it 'should land a plane at an airport' do
      expect { subject.land(plane).to_not raise_error }
    end
  end

  
end
