require "weather"

describe Weather do
  
  it "often confirmed as not stormy" do
    expect_any_instance_of(Object).to receive(:rand).with(13).and_return(0)
    expect(subject.stormy?).to eq(false)

    expect_any_instance_of(Object).to receive(:rand).with(13).and_return(1)
    expect(subject.stormy?).to eq(false)

    expect_any_instance_of(Object).to receive(:rand).with(13).and_return(2)
    expect(subject.stormy?).to eq(false)

    expect_any_instance_of(Object).to receive(:rand).with(13).and_return(3)
    expect(subject.stormy?).to eq(false)

    expect_any_instance_of(Object).to receive(:rand).with(13).and_return(4)
    expect(subject.stormy?).to eq(false)

    expect_any_instance_of(Object).to receive(:rand).with(13).and_return(5)
    expect(subject.stormy?).to eq(false)

    expect_any_instance_of(Object).to receive(:rand).with(13).and_return(6)
    expect(subject.stormy?).to eq(false)

    expect_any_instance_of(Object).to receive(:rand).with(13).and_return(7)
    expect(subject.stormy?).to eq(false)

    expect_any_instance_of(Object).to receive(:rand).with(13).and_return(8)
    expect(subject.stormy?).to eq(false)

    expect_any_instance_of(Object).to receive(:rand).with(13).and_return(9)
    expect(subject.stormy?).to eq(false)

    expect_any_instance_of(Object).to receive(:rand).with(13).and_return(10)
    expect(subject.stormy?).to eq(false)

    expect_any_instance_of(Object).to receive(:rand).with(13).and_return(11)
    expect(subject.stormy?).to eq(false)
  end

  it "can be stormy" do
    expect_any_instance_of(Object).to receive(:rand).with(13).and_return(12)
    expect(subject.stormy?).to eq(true)
  end
end
