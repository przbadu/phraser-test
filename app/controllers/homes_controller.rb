class HomesController < ApplicationController
  def index
    Phrase.reset_all!
    @remaining_phrase = Phrase.unread.count
    @phrase = Phrase.order('RANDOM()').first
  end

  def show
    p = Phrase.find(params[:id])
    p.read_phrase!

    @phrase = Phrase.unread.order('RANDOM()').first
    @remaining_phrase = Phrase.unread.count

    @error = "No more phrase to read, Please refresh the page!" if @phrase.blank?

    respond_to do |f|
      f.js
    end
  end
end
