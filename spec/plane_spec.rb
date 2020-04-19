# understanding plane object tsts
require 'plane'
describe Plane do

  it 'confirm that plane is flying' do
    expect(subject).to be_flying
  end

end
