require 'plane'

describe Plane do
 it 'notifies when landed' do
   expect(subject.is_landed).to eq true 
 end

end
