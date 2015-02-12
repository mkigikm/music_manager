class NotesController < ApplicationController
  before_action :require_login

  def create
    @note = Note.new(note_params)
    @note.author = current_user
    @note.save
    redirect_to track_url(@note.track)
  end

  def destroy
    @note = Note.find(params[:id])

    if current_user == @note.author
      @note.destroy!
      redirect_to track_url(@note.track)
    else
      render text: "You naughty boy", status: :forbidden
    end
  end

  private
  def note_params
    params.require(:note).permit(:author_id, :track_id, :body)
  end
end
