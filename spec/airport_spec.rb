require "airport"

describe Airport do
  let(:subject) { Airport.new }

  it "is an instance of a Airport" do
    expect(subject).to be_a(Airport)
  end

  it " has passengers" do
    expect(subject.passengers).to have_key(:passengers)
  end
end
