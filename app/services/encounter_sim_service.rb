class EncounterSimService

  def spells
    get_url("/api/v1/spells")[:data]
  end

  def monsters
    get_url("/api/v1/monsters")[:data]
  end

  def players
    get_url("/api/v1/players")[:data]
  end

  def monster(monster_index)
    get_url("/api/v1/monsters/#{monster_index}")
  end

  def encounter_results(id)
    get_url("/api/v1/encounters/#{id}")
  end

  def encounters(id)
    get_url("/api/v1/encounters?user_id=#{id}")
  end

  def encounter_players(id)
    get_url("/api/v1/encounters/players?sim_id=#{id}")
  end

  def encounter_creation(hash_data)

    post = conn.post "/api/v1/encounters" do |req|
      req.headers[:content_type] = 'application/json'
      req.body = hash_data.to_json
    end
    JSON.parse(post.body, symbolize_names: true)
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names:true)
  end

  def conn
    Faraday.new(url: 'https://encountersim-be-78e8d38428a7.herokuapp.com/')
  end
end