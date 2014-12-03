class HostsController < ApplicationController
  before_action :set_host, only: [:item, :edit, :update, :destroy]

  # GET /hosts
  def index
    @hosts = Host.all
  end

  # GET /item
  def item
    respond_to do |format|
        format.js
    end
  end

  # GET /hosts/new
  def new
    if Host.last.present? and Host.last.position.present?
      @position = Host.last.position + 1
    else
      @position = 1
    end
    @host = Host.new
  end

  # GET /hosts/1/edit
  def edit
    @position = Host.where(id: params[:id]).first.position
  end

  # POST /hosts
  def create
    @host = Host.new(host_params)

    respond_to do |format|
      if @host.save
        format.html { redirect_to hosts_url, notice: 'Host was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /hosts/1
  def update
    respond_to do |format|
      if @host.update(host_params)
        format.html { redirect_to hosts_url, notice: 'Host was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /hosts/1
  def destroy
    @host.destroy
    respond_to do |format|
      format.html { redirect_to hosts_url, notice: 'Host was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_host
      @host = Host.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def host_params
      params.require(:host).permit(:name, :address, :position, :mc_address)
    end
end
