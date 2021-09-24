module PlaneIdGenerator
  def generate_id
    ordinal = rand(26)
    id = (0...4).map { (65 + ordinal).chr }.join
  end
end
