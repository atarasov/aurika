# coding: utf-8
class Article < ActiveRecord::Base
  has_many :publications

  rails_admin do
    label "Категории"
    list do
      field :name

      field :publications
      field :created_at
      field :updated_at

    end
    edit do
      field :name

      field :publications
    end
  end
end
