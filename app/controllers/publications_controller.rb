class PublicationsController < ApplicationController
  before_filter :get_article
  def index
    if params[:article]
      @publications = Publication.order("created_at DESC").where(:article_id => params[:article])
    else
      @publications = Publication.order("created_at DESC").all
    end

  end

  def show
    @publication = Publication.find(params[:id])
  end

  def get_article
    @articles = Article.all
  end

end
