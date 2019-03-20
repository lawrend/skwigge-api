class Collection < ApplicationRecord
  has_many :collection_works
  has_many :works, through: :collection_works
  require 'faraday-cookie_jar'
  
  def self.get_object
    conn = Faraday.new(:url => "https://rijksmuseum.nl/") do |req|
      req.adapter Faraday.default_adapter
      req.params['key'] = ENV['MUSEUM_API_KEY']
      req.params['format'] = 'json'
    end
    @objnum="SK-C-5"
    resp = conn.get("api/en/collection/#{@objnum}") do |req|
      req.headers['cookie'] = 'rmis_gdpr_accepted=1'
    end
    # conn = Faraday.new "https://rijksmuseum.nl/api/#{@culture}/collection/#{@objnum}"
    # resp = conn.get "api/en/collection/#{@objnum}?format=json&key=#{ENV['MUSEUM_API_KEY']}"
    @thisthing = resp.body

  end

  def self.get_simple
    conn = Faraday.get 'https://foaas.com/operations'
    @resp = conn.body
  end

  def self.get_explicit
    resp = Faraday.get "https://rijksmuseum.nl/api/en/collection/SK-C-5?format=json&key=Pm44XICe"
    @explicit = resp.body 
  end

  def self.get_archive
    @tommy = "TheAdventuresOfTomSawyer_201303"
    resp = Faraday.get "https://archive.org/metadata/#{@tommy}"
    @archive = resp.body
  end

  def self.get_enigma
    conn = Faraday.new "https://public.enigma.com/api/" 
    resp = conn.get("collections/") do |req|
      req.headers['Authorization'] = "Bearer: #{ENV['ENIGMA_API_KEY']}"
      req.params['query'] = 'homes'
    end
    @enigma = resp.body
  end


end
