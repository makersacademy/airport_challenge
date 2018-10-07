require './Plane.rb'

describe Plane do
  it 'exists' do
    expect(Plane.new).not_to eq nil
  end

  it 'responds to @status' do
  plane = Plane.new
    expect(plane.status).to eq "flying"
  end
end