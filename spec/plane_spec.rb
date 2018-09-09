require 'plane'

describe Plane do

  context '[Pupose:result]' do

    context 'instance variable' do

      it 'should be initalized with @destination and @flight_name' do
        plane = Plane.new("BA0999", "London")
        expect(plane::flight_num).to eq("BA0999")
        expect(plane::destination).to eq("London")
      end
      
    end
  end
end
