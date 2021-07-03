require 'plane'
  
describe Plane do
  it 'Has a status' do
    expect(subject).to respond_to(:status)
  end
end
