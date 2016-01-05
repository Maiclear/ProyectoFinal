class EventsController < ApplicationController
  load_and_authorize_resource :ong
  load_and_authorize_resource :event, through: :ong, except: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    if params[:ong_id].present?
      ong = Ong.find(params[:ong_id])
      @events = ong.events
    elsif params[:tag].present?
      @events = Event.tagged_with(params[:tag])
    elsif params[:search].present?
      @events = Event.near(params[:search], 50, :order => :distance)
    else
      @events = Event.all
    end

  end

  # GET /events/1
  # GET /events/1.json
  def show
    @ong = @event.ong
    @comments = @event.comments.reverse
    @tags = @event.tags
  end

  # GET /events/new
  def new
    @event = Event.new
    @ong = Ong.find(params[:ong_id])
  end

  # GET /events/1/edit
  def edit
    @ong = @event.ong
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.ong = Ong.find(params[:ong_id])
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def create_comment
  #   @comment = @post.likes.build(user: current_user)

  #   if @post.liked_by? current_user
  #     @post.remove_like current_user
  #     redirect_to @post, notice: 'Tu like a sido eliminado :('
  #   elsif @post.save
  #     redirect_to @post, notice: 'Gracias por tu like :D'
  #   else
  #     redirect_to @post, notice: 'Tu like no se ha guardado :('
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :description, :day, :address, :longitude, :latitude, :spot, :ong_id, :tag_list, :city, :country)
    end
end
