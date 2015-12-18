class OngsController < ApplicationController
  load_and_authorize_resource

  # GET /ongs
  # GET /ongs.json
  def index
      @ongs = Ong.all
  end

  # GET /ongs/1
  # GET /ongs/1.json
  def show
    @comments = @ong.comments.reverse
    @events = @ong.events
  end

  # GET /ongs/new
  def new
    @ong = Ong.new
  end

  # GET /ongs/1/edit
  def edit
  end

  # POST /ongs
  # POST /ongs.json
  def create
    @ong = Ong.new(ong_params)
    @ong.user = current_user if user_signed_in?
    respond_to do |format|
      if @ong.save
        format.html { redirect_to @ong, notice: 'Ong was successfully created.' }
        format.json { render :show, status: :created, location: @ong }
      else
        format.html { render :new }
        format.json { render json: @ong.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ongs/1
  # PATCH/PUT /ongs/1.json
  def update
    respond_to do |format|
      if @ong.update(ong_params)
        format.html { redirect_to @ong, notice: 'Ong was successfully updated.' }
        format.json { render :show, status: :ok, location: @ong }
      else
        format.html { render :edit }
        format.json { render json: @ong.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ongs/1
  # DELETE /ongs/1.json
  def destroy
    @ong.destroy
    respond_to do |format|
      format.html { redirect_to ongs_url, notice: 'Ong was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def create_comment
  #   @comment = @ong.comments.build(user: current_user, content: params[:content])

  #   if @comment.save
  #     redirect_to @ong, notice: 'Gracias por tu comentario :D'
  #   else
  #     redirect_to @ong, notice: 'Tu comentario no se ha guardado :('
  #   end
  # end

  # def delete_comment
  #   comment = Comment.find(params[:comment_id])
  #   comment.destroy
  #   respond_to do |format|
  #     format.html { redirect_to @ong, notice: 'Comment successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ong
      @ong = Ong.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ong_params
      params.require(:ong).permit(:name, :description, :image, :mail, :user_id, :remove_image, :image_cache, :remote_image_url)
    end
end
