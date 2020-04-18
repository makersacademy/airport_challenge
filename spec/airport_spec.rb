require 'airport'

describe Airport do

  it 'responds to full?' do
    expect(subject).to respond_to(:full?)
  end

end
