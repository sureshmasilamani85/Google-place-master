class GooglePlaces
  include HTTParty

  attr_accessor :developer_key, :search_name

  def initialize(search_name)
    @developer_key = config["#{Rails.env}"]["developer_key"]
    @search_name = search_name
  end

  def search_place
    Hashie::Mash.new(self.class.get(base_uri + 'maps/api/place/textsearch/json?', :query => get_query ))
  end

  def status
    search_place.status
  end

  private

  def base_uri
    'https://maps.googleapis.com/'
  end

  def get_query
   { query: @search_name, sensor: 'true', key: developer_key }
  end

  def config
    YAML.load_file('./config/google_places.yml')
  end

end