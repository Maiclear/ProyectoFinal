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
          url: "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=A|39B1A4|39B1A4",
          :width   => 40,
          :height  => 40,
         },
         title: :"Yo",
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
                  picture: {
          url: "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=A|39B1A4|39B1A4",
          :width   => 40,
          :height  => 40,
         },
         title: :"Yo",
        }


    end

    respond_to do |format|
      format.js
    end

  end

end
