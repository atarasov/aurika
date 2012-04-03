# coding: utf-8
class Event < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10

  rails_admin do
    edit do
      field :description, :text do
        ckeditor true
      end
    end
  end
end
