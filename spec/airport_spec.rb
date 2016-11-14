require 'airport'

describe Airport do

it 'instructs a plane to land' do
  expect(subject.instructs_landing).to eq true
  end

it 'confirms a plane has landed' do
  expect(subject.confirms_landing).to eq true
  end

end
