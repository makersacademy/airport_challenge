require_relative "../lib/airport"

describe Airport do
  it { is_expected.to respond_to :land }

  it "instructs a plane to land" do
    expect(subject.land).to eq(true)
  end

end
