# coding: utf-8
class Publication < ActiveRecord::Base
  belongs_to :article

  rails_admin do
    label "Публикации"
    list do
      field :title

      field :description do
        formatted_value do # used in form views
          value.to_s.html_safe
        end

      end
      field :article
      field :created_at
      field :updated_at

    end
    edit do
      field :title
      field :description, :text do
        ckeditor true
      end
      field :article
    end
  end
end
