# coding: utf-8
class FotoAlbum < ActiveRecord::Base
  has_many :fotos, :order => 'created_at desc', :dependent => :destroy

  cattr_reader :per_page
  @@per_page = 6

end
