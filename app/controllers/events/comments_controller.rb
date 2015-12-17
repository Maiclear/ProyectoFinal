class Events::CommentsController < CommentsController
  before_action :set_comentable

  private

    def set_comentable
      @commentable = Event.find(params[:event_id])
    end
end