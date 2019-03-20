class Collection < ApplicationRecord
  has_many :collection_works
  has_many :works, through: :collection_works
 
  def self.search_enigma_api(term)
    conn = Faraday.new "https://public.enigma.com/api/" 
    resp = conn.get("collections/") do |req|
      req.headers['Authorization'] = "Bearer: #{ENV['ENIGMA_API_KEY']}"
      req.params['query'] = term
    end
    @enigma = resp.body
  end


end
