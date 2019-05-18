require 'flying_objects/helicopter'
require 'support/shared_examples_for_flying_object'

describe Helicopter do
  it_behaves_like FlyingObject

  it 'makes a noise' do
    expect(subject.make_noise)
        .to eq('chopp-chopp-chop-chopp, chop-a-chop-akk-chop-cchopp-chop')
  end
end