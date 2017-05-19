class EmplsController < ApplicationController
  before_action :set_empl, only: [:show, :edit, :update, :destroy, :change_depart]
  skip_before_action :check_ctr_auth, only: [:new, :create]
  skip_before_filter :require_login, :only => [:new, :create]




  # GET /empls
  # GET /empls.json
  def index
    @empls = Empl.all
  end

  def search
    if params.has_key?('search')
      @empls = Empl.search(params['search'])
    else
      @empls = []
    end
    params['search'] ||= {}
  end

  # GET /empls/1
  # GET /empls/1.json
  def show
  end

  # GET /empls/new
  def new
    @empl = Empl.new
    @empl.build_depart
  end

  # GET /empls/1/edit
  def edit
  end

  # POST /empls
  # POST /empls.json
  def create
    @empl = Empl.new(empl_params)

    respond_to do |format|
      if @empl.save
        format.html { redirect_to @empl, notice: 'Empl was successfully created.' }
        format.json { render :show, status: :created, location: @empl }
      else
        format.html { render :new }
        format.json { render json: @empl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empls/1
  # PATCH/PUT /empls/1.json
  def update
    respond_to do |format|
      if @empl.update(empl_params)
        format.html { redirect_to @empl, notice: 'Empl was successfully updated.' }
        format.json { render :show, status: :ok, location: @empl }
      else
        format.html { render :edit }
        format.json { render json: @empl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empls/1
  # DELETE /empls/1.json
  def destroy
    @empl.destroy
    respond_to do |format|
      format.html { redirect_to empls_url, notice: 'Empl was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def change_depart
    @empl.depart = Depart.find_by_id(params[:empl][:depart_id])
    respond_to do |f|
      if @empl.save
        f.html { redirect_to @empl, notice: 'Сотрудник изменен.' }
        f.json { render :show, status: :ok, location: @empl }
      else
        r.depart = depart; r.save
        f.html { render :edit }
        f.json { render json: @empl.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empl
      @empl = Empl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empl_params
      params.require(:empl).permit(:last_name, :first_name, :second_name, :birthday, :passport, :inn, :post, :depart_id,
      depart_attributes: [:id, :_destroy, :d_name])
    end
    def check_ctr_auth()
      case action_name.to_sym
      when :show
        if @current_role_user.try(:is_admin?)
          return true
        end
        if @current_role_user.try(:is_operator?)
          return true
        end
      when :index
        if @current_role_user.try(:is_admin?)
          return true
        end
        if @current_role_user.try(:is_operator?)
          return true
        end
      when :new
        if @current_role_user.try(:is_admin?)
          return true
        end
        if @current_role_user.try(:is_operator?)
          return false
        end
      when :create
        if @current_role_user.try(:is_admin?)
          return true
        end
        if @current_role_user.try(:is_operator?)
          return false
        end
      when :edit
        if @current_role_user.try(:is_operator?)
          return false
        end
        if @current_role_user.try(:is_admin?)
          return true
        end
      when :destroy
        if @current_role_user.try(:is_operator?)
          return false
        end
        if @current_role_user.try(:is_admin?)
          return true
        end
      else
        if @current_role_user.try(:is_operator?)
          return false
        end
        if @current_role_user.try(:is_admin?)
          return true
        end
      end
    end
end
