class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    @comment.save
    redirect_to @commentable, notice: "Tu comentario ha sido creado con éxito"
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: 'Tu comentario ha sido borrado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)

    end
end
