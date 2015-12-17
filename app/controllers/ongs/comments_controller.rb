class Ongs::CommentsController < CommentsController
  before_action :set_comentable


  private

    def set_comentable
      @commentable = Ong.find(params[:ong_id])
    end
end