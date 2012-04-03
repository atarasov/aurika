# coding: utf-8
class FotosController < ApplicationController


  def access_denied
    redirect_to root_path
  end
    
  self.allow_forgery_protection = false
  
  def index
    @fotos = Foto.all
    @foto_album = FotoAlbum.find(:first)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fotos }
    end
  end

  # GET /fotos/1
  # GET /fotos/1.xml
  def show
    @foto = Foto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @foto }
    end
  end

  # GET /fotos/new
  # GET /fotos/new.xml
  def new
    @foto = Foto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @foto }
    end
  end

  # GET /fotos/1/edit
  def edit
    @foto = Foto.find(params[:id])
  end

  # POST /fotos
  # POST /fotos.xml
  def create_foto
    @foto_album = FotoAlbum.find_by_id(params[:foto_album_id])
    params[:foto][:foto_album_id] = params[:foto_album_id]
    #raise params.inspect
    Foto.create(params[:foto])
    @fotos = Foto.find(:all, :conditions => {:foto_album_id => params[:foto_album_id]})

    responds_to_parent do
      render :update do |page|
        page.insert_html :bottom, "mlt_elements", :partial => 'foto_albums/fotos', :object => @foto
        #page.visual_effect :highlight, "ma_el_#{@product.id}", :duration => 1
      end
    end
  end

  # PUT /fotos/1
  # PUT /fotos/1.xml
  def update
    @foto = Foto.find(params[:id])

    respond_to do |format|
      if @foto.update_attributes(params[:foto])
        flash[:notice] = 'Фотография успешно обновленна.'
        format.html { redirect_to(@foto) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @foto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fotos/1
  # DELETE /fotos/1.xml
  def destroy
    @foto = Foto.find(params[:id])
    @foto.destroy

    respond_to do |format|
      format.html { redirect_to(fotos_url) }
      format.xml  { head :ok }
    end
  end
end
