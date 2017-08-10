class HomesController < ApplicationController
  def index
    Phrase.reset_all!
    @remaining_phrase = Phrase.unread.count
    @phrase = Phrase.random.first
  end

  def show
    get_phrase.read_phrase!
    @phrase = Phrase.unread.random.first
    @remaining_phrase = Phrase.unread.count

    if @phrase.blank?
      @error = "No more phrase to read, Please refresh the page!"
    end

    respond_to do |format|
      format.js
    end
  end

  private

  def get_phrase
    @get_phrase = Phrase.find(params[:id])
  end
end
