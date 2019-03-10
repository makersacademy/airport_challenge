require './lib/airport'
require './lib/plane'

describe Plane do
	 describe '#flying' do
 		 it 'returns status of plane' do
  		  expect(subject.flying).to eq true
  		end
 	end
end
