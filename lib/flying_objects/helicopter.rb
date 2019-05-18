require 'flying_objects/flying_object'

class Helicopter
  include(FlyingObject)

  def make_noise
    'chopp-chopp-chop-chopp, chop-a-chop-akk-chop-cchopp-chop'
  end
end
