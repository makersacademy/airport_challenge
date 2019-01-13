require 'airport'

describe Airport do

   it 'can be instructed to accept a plane landing' do
     plane = double('plane')
     expect(subject.land(plane)).to eq plane
   end

end
