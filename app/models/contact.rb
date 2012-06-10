# coding: utf-8
class Contact < ActiveRecord::Base

  rails_admin do
    label "Контакты"
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
      field :title
      field :description, :text do
        ckeditor true
      end
    end
  end
end
