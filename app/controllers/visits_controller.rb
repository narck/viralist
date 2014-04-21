class VisitsController < ApplicationController
  before_action :set_visit, only: [:show, :edit, :update, :destroy]

  # GET /visits
  # GET /visits.json
  def index
    @visits = Visit.all

    order = params[:order] || 'visitdate'

    case order
      when 'visitdate' then @visits.sort_by!{ |v| v.visitdate }

    end
  
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
    
  end

  # GET /visits/new
  def new
    @users = User.all
    @stores = Store.all
    @visit = Visit.new
  end

  # GET /visits/1/edit
  def edit
    @stores = Store.all
    @visit = Visit.new
  end

  # POST /visits
  # POST /visits.json
  def create
    
    @visit = Visit.new(visit_params)

    print @stores
    respond_to do |format|
      if @visit.save
        format.html { redirect_to @visit, notice: 'Visit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @visit }
      else
        format.html { render action: 'new' }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visits/1
  # PATCH/PUT /visits/1.json
  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to @visit, notice: 'Visit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to visits_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_params
      params.require(:visit).permit(:visitdate, :note, :user_id, :store_id)
    end
end

