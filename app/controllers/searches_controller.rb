class SearchesController < ApplicationController
  before_filter :google_place, only: :set_place

  def home

  end

  def set_places
    @results= google_place.search_place.results
    @error_message = google_place.status unless google_place.status == "OK"
    respond_to :js
  end

  private

  def google_place
    GooglePlaces.new(params[:search])
  end
end
