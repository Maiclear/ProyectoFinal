class LocationsController < ApplicationController

  def get_map

    @user = current_user if user_signed_in?
    if @user

      @events = Event.near(@user, 10)

      ulat = @user.latitude
      ulng = @user.longitude

      @markers = Gmaps4rails.build_markers(@events) do |event, marker|
        marker.lat event.latitude
        marker.lng event.longitude
        marker.title event.name
      end

      @usermarker = {
        lat: ulat,
        lng: ulng,
        picture: {
            "icon": "http://maps.google.com/mapfiles/ms/icons/blue-dot.png",

         }
      }
    else
      @events = Event.all
      @markers = Gmaps4rails.build_markers(@events) do |event, marker|
        marker.lat event.latitude
        marker.lng event.longitude
        marker.title event.name
      end

      @usermarker = {
          lat:-33.471983,
          lng:-70.628265,
        }


    end

    respond_to do |format|
      format.js
    end

  end

end
