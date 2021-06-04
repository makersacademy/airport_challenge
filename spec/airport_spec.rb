require 'airport'
describe Airport do

  # it 'has an airport that can instruct planes' do

  it 'can land a plane' do
    expect(subject).to respond_to(:land_plane)
  end
  
end
