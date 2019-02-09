require 'airport'

describe Airport do

it 'responds to land' do
  expect(subject).to respond_to :land
end

it 'instructs a plane to land' do
  expect(subject.land).to eq true 
end

end
