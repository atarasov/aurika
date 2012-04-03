# coding: utf-8
class FotoAlbumsController < ApplicationController



  def access_denied
    redirect_to root_path
  end

  def index
    @foto_albums = FotoAlbum.paginate :page => params[:page], :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @foto_albums }
    end
  end

  # GET /foto_albums/1
  # GET /foto_albums/1.xml
  def show
    @foto_album = FotoAlbum.find(params[:id])
    @fotos = @foto_album.fotos
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @foto_album }
    end
  end

  # GET /foto_albums/new
  # GET /foto_albums/new.xml
  def new
    @foto_album = FotoAlbum.create
    @foto = Foto.new

    params[:albom_id] =  @foto_album.id
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @foto_album }
    end
  end

  # GET /foto_albums/1/edit
  def edit
    @foto_album = FotoAlbum.find(params[:id])
     @fotos = Foto.find(:all, :conditions => {:foto_album_id => params[:id]})
  end

  # POST /foto_albums
  # POST /foto_albums.xml
  def create
    @foto_album = FotoAlbum.new(params[:foto_album])

    respond_to do |format|
      if @foto_album.save
        flash[:notice] = 'Фотоальбом успешно создан.'
        format.html { redirect_to(@foto_album) }
        format.xml  { render :xml => @foto_album, :status => :created, :location => @foto_album }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @foto_album.errors, :status => :unprocessable_entity }
      end
    end
  end
  # PUT /foto_albums/1
  # PUT /foto_albums/1.xml
  def update
    @foto_album = FotoAlbum.find(params[:id])

    respond_to do |format|
      if @foto_album.update_attributes(params[:foto_album])
        flash[:notice] = 'Фотоальбом успешно обновлен.'
        format.html { redirect_to(@foto_album) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @foto_album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /foto_albums/1
  # DELETE /foto_albums/1.xml
  def destroy
    @foto_album = FotoAlbum.find(params[:id])
    @foto_album.destroy

    respond_to do |format|
      format.html { redirect_to(foto_albums_url) }
      format.xml  { head :ok }
    end
  end
  
  protected

  # The default 'get_upload_text' method throws an exception.  You must override this method in your controller.  It
  # is used by the swf upload call to generate the html to be returned to the client.
  # Here's an example:
  def get_upload_text(upload)
    render_to_string( :partial => 'uploads/upload_row', :object => upload, :locals => { :parent => @parent } )
  end

end
