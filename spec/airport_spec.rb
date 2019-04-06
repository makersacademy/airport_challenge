require 'airport'
require 'plane'

describe 'airport' do
 it 'should respond to land_plane' do
   expect(subject).to respond_to :land_plane
 end
end 
