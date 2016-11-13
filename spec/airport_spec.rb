require "airport"

describe Airport do
  plane = Plane.new
  it 'Checks if airport responds to landing message' do
    expect(subject).to respond_to(:landed?)
  end

  it 'Checks if plane has landed?' do
    expect(subject.landed?(plane)).to eq true
  end

end
