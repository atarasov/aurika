# coding: utf-8
require 'mime/types'

class Foto < ActiveRecord::Base
  belongs_to :foto_album
  


  has_attached_file :foto,
  :styles => {
    :thumb => "x100>",
    :preveiw => "x150>",
    :mini => "50x50>"
  },
  :url => "/system/assets/fotos/:id/:style/:basename.:extension",
  :path => ":rails_root/public/system/assets/fotos/:id/:style/:basename.:extension",
  :default_url => "/images/No_photo.jpg"

  validates_attachment_size :foto, :less_than => 15.megabytes
  validates_attachment_content_type :foto, :content_type => ['image/jpeg', 'image/png', 'image/jpg', 'image/gif']

#  attr_accessor :foto_file_name
  def can_upload?(check_user)
        true
  end


  rails_admin do
    label "Фотографии"
    list do
      field :title

      field :description do
        formatted_value do # used in form views
          value.to_s.html_safe
        end

      end
      field :foto
      field :created_at
      field :updated_at

    end
    edit do
      field :title
      field :description, :text do
        ckeditor true
      end
      field :foto
    end
  end

end
