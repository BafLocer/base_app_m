class EmplprojsController < ApplicationController
  before_action :set_emplproj, only: [:show, :edit, :update, :destroy]

  # GET /emplprojs
  # GET /emplprojs.json
  def index
    @emplprojs = Emplproj.all
  end

  # GET /emplprojs/1
  # GET /emplprojs/1.json
  def show
  end

  # GET /emplprojs/new
  def new
    @emplproj = Emplproj.new
  end

  # GET /emplprojs/1/edit
  def edit
  end

  # POST /emplprojs
  # POST /emplprojs.json
  def create
    @emplproj = Emplproj.new(emplproj_params)

    respond_to do |format|
      if @emplproj.save
        format.html { redirect_to @emplproj, notice: 'Emplproj was successfully created.' }
        format.json { render :show, status: :created, location: @emplproj }
      else
        format.html { render :new }
        format.json { render json: @emplproj.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emplprojs/1
  # PATCH/PUT /emplprojs/1.json
  def update
    respond_to do |format|
      if @emplproj.update(emplproj_params)
        format.html { redirect_to @emplproj, notice: 'Emplproj was successfully updated.' }
        format.json { render :show, status: :ok, location: @emplproj }
      else
        format.html { render :edit }
        format.json { render json: @emplproj.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emplprojs/1
  # DELETE /emplprojs/1.json
  def destroy
    @emplproj.destroy
    respond_to do |format|
      format.html { redirect_to emplprojs_url, notice: 'Emplproj was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emplproj
      @emplproj = Emplproj.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emplproj_params
      params.require(:emplproj).permit(:empl_id, :project_id)
    end
end
