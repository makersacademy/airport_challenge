require 'airport'

describe Airport do

  it 'airport instruct plane to land' do
    expect(subject).to respond_to(:instruct_to_land)
  end

end
