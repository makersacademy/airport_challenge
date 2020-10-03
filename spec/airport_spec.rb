require 'airport'

describe Airport do

  it " allows planes to land" do
    expect(subject).to respond_to(:land).with(1).argument
  end 
end
