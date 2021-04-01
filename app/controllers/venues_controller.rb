class VenuesController < ApplicationController

    def index
        @venues = Venue.all
    end

    def show    
        @venue = Venue.find_by_id(params[:id])
        if @venue.blank?
            redirect_to venues_path
        end
    end
end
