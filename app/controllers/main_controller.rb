# coding: utf-8
class MainController < ApplicationController
  def index
    @events = Event.limit(5)
    @publications = Publication.limit(5)
  end

  def about
  end

  def about_dance

  end

  def schedule

  end

  def payment

  end

  def help

  end

  def camp_scheld

  end

end
