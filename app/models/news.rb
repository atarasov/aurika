# coding: utf-8
class News < ActiveRecord::Base
  rails_admin do
    edit do
      field :description, :text do
        ckeditor true
      end
    end
  end
end
