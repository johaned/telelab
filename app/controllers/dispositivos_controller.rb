class DispositivosController < ApplicationController

  before_filter :get_dispositivo_constants, :only => [:new, :edit, :create, :update]

  def index
    @dispositivos = Dispositivo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dispositivos }
    end
  end

  def show
    @dispositivo = Dispositivo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dispositivo }
    end
  end

  def new
    @dispositivo = Dispositivo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dispositivo }
    end
  end

  def edit
    @dispositivo = Dispositivo.find(params[:id])
  end

  def create
    @dispositivo = Dispositivo.new(params[:dispositivo])

    respond_to do |format|
      if @dispositivo.save
        format.html { redirect_to(@dispositivo, :notice => 'Dispositivo was successfully created.') }
        format.xml  { render :xml => @dispositivo, :status => :created, :location => @dispositivo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dispositivo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @dispositivo = Dispositivo.find(params[:id])

    respond_to do |format|
      if @dispositivo.update_attributes(params[:dispositivo])
        format.html { redirect_to(@dispositivo, :notice => 'Dispositivo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dispositivo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @dispositivo = Dispositivo.find(params[:id])
    @dispositivo.destroy

    respond_to do |format|
      format.html { redirect_to(dispositivos_url) }
      format.xml  { head :ok }
    end
  end

  def get_telebot_config
    @config = {}
    @config[:name]= "#{APP_CONFIG[:irc][:client][:nick_prefix]}#{APP_CONFIG[:irc][:client][:nick]}"
    @config[:sysopChannel]= '#GODCHANNEL'
    @config[:additionalChannels]= APP_CONFIG[:irc][:client][:default_channels]

    @config[:ircServerAddress]= APP_CONFIG[:irc][:server][:ip]
    @config[:ircServerPort]= APP_CONFIG[:irc][:server][:port]
    @config[:ircServerPassword]= APP_CONFIG[:irc][:server][:password]
    @config[:enableSerial] = APP_CONFIG[:irc][:client][:enable_serial] || 0

    dispositivos = Dispositivo.ok
    device_configs = dispositivos.map do |dispositivo|
      {
          :device_id => dispositivo.id,
          :name => dispositivo.nombre,
          :com_port => dispositivo.com,
          :irc_channel => "#device_#{dispositivo.id}"
      }
    end

    @config[:deviceConfigs] = device_configs
    render :json => @config
  end

  private
  def get_dispositivo_constants
    @categories = Dispositivo::CATEGORIAS
    @types = Dispositivo::TYPES
  end
end
