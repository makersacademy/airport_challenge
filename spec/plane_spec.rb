require './docs/plane'
describe Plane do

  it 'can make a new plane' do
    expect(subject).to be_kind_of(Plane)
  end

  it 'can take off' do
    expect(subject).to respond_to(:take_off)
  end
end
