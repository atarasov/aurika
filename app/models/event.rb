# coding: utf-8
class Event < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10


  rails_admin do
    label "Новости"
    list do
      field :title

      field :description do
        formatted_value do # used in form views
          value.to_s.html_safe
        end

      end
      field :created_at
      field :updated_at

    end
    edit do
      field :title do
        formatted_value do # used in form views
          value.to_s.upcase
        end

      end
      field :description, :text do
        ckeditor true
      end
    end
  end
end
