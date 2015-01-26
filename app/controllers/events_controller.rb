class EventsController < ApplicationController

  before_action :is_authenticated?

  require 'open-uri'
  require 'json'

  def create
    params = {  near: 'ballard wa',
                query: 'coffee',
                price: '1,2',
                client_id: ENV['FOURSQUARE_KEY'],
                client_secret: ENV['FOURSQUARE_SECRET'],
                v: '20130815',
                m: 'foursquare',
                openNow: '1'
                }

    response = Foursquare.query(params)

    @venues = response['response']['groups'].first['items']
    @venue = @venues[rand(0..@venues.length)]['venue']
    @venue_name = @venue['name']
    @venue_location = @venue['location']['address']
  end

  def show
    @page = 'event'
    @user = current_user

  end

  def flake

  end

end
