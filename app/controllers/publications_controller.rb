class PublicationsController < ApplicationController
  def index
    @publications = Publication.all.order("created_at DESC")
  end

  def show
    @publication = Publication.find(params[:id])
  end

end
