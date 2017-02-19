require 'plane'

describe Plane do

it 'Confirms that plane has landed' do
  expect(subject.land).to eq true
end

it 'Confirms that plane has taken off' do
  expect(subject.flying).to eq false    #flying is actually self.land hence equals false here
end

end
