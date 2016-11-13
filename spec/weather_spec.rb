require 'weather'

describe Weather do

  it "responds to a method is_stormy" do
    expect(subject).to respond_to (:is_stormy?)
  end

end
