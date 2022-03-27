require "airport"

describe Airport do
  it "enables an airplane to land when instructed to" do 
    expect(subject).to respond_to :land_airplane
  end
end
