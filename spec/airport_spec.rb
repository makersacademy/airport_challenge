require 'airport'

describe Airport do

it 'confirms when a plane has landed' do
  expect(subject.confirms_landing).to eq true
  end

end
