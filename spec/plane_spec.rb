require 'plane'
describe Plane do

  it 'expects plane to be airborne' do
    expect(subject.status == 'airborne').to eq true
  end

end
