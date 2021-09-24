module PlaneIdGenerator
  def generate_id(id_length = 4)
    id = (0...id_length).map { (65 + rand(26)).chr }.join
  end
end
