class HomesController < ApplicationController
  def index
    Phrase.reset_all!
    @phrase = Phrase.order('RANDOM()').first
  end

  def show
    p = Phrase.find(params[:id])
    p.read_phrase!

    @phrase = Phrase.where(status: 'unread').order('RANDOM()').first

    @error = "No more phrase to read, Please refresh the page!" if @phrase.blank?

    respond_to do |f|
      f.js
    end
  end
end
