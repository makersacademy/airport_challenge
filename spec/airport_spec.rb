require 'airport'

describe Airport do
  it { is_expected.to respond_to :land_plane }

  it "Should checks that land_plane adds a Plane object to my_airport[]" do
    # stub
    allow(subject).to receive(:rand).and_return(1)
    expect(subject.land_plane).to include(Plane)
  end

  it { is_expected.to respond_to :take_off, :search_for_plane }

  it "Should checks that take_off removes a Plane object from my_airport[]" do
    # stub
    allow(subject).to receive(:rand).and_return(1)
    subject.land_plane

    expect(subject.take_off).to eq []
  end

  it "Should check a Plane exists" do
    # stub
    allow(subject).to receive(:rand).and_return(1)
    subject.land_plane
    expect(subject.search_for_plane).to eq "This plane is in the Airport"
  end

  it { is_expected.to respond_to :check_ap_capacity }

  it "Should return true or false when calling check_ap_capacity" do
    expect(subject.check_ap_capacity).to eq(true || false)
  end

  it { is_expected.to respond_to :update_max_cap }

  it "Should return max_cap" do
    num = 10
    expect(subject.update_max_cap(num)).to eq(num)
  end

  it { is_expected.to respond_to :check_weather }

  it "Should return a string stormy or sunny" do
    # stub
    allow(subject).to receive(:rand).and_return(1)
    expect(subject.check_weather).to eq("Sunny")
  end

end
