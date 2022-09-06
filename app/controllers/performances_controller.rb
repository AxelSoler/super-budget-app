class PerformancesController < ApplicationController
  before_action :set_performance, only: %i[show edit update destroy]

  # GET /performances or /performances.json
  def index
    @group = Group.find(params[:group_id])
    @performances = @group.performance.all.order(created_at: :desc)
  end

  # GET /performances/1 or /performances/1.json
  def show; end

  # GET /performances/new
  def new
    @group = Group.find(params[:group_id])
    @groups = Group.all
    @performance = Performance.new
  end

  # GET /performances/1/edit
  def edit; end

  # POST /performances or /performances.json
  def create
    @group = Group.find(params[:group_id])
    @performance = @group.performance.new(user_id: current_user.id, name: performance_params[:name],
                                          amount: performance_params[:amount])
    if params[:budget_ids]
      params[:budget_ids].each do |group_id|
        group = Group.find(group_id)
        group.performance << @performance
      end
    else
      redirect_to new_group_performance_path(@group)
      return
    end

    respond_to do |format|
      if @performance.save
        format.html { redirect_to group_performances_path, notice: 'Performance was successfully created.' }
        format.json { render :show, status: :created, location: @performance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /performances/1 or /performances/1.json
  def update
    respond_to do |format|
      if @performance.update(performance_params)
        format.html { redirect_to group_performances_path, notice: 'Performance was successfully updated.' }
        format.json { render :show, status: :ok, location: @performance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performances/1 or /performances/1.json
  def destroy
    @performance.destroy

    respond_to do |format|
      format.html { redirect_to group_performances_path, notice: 'Performance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_performance
    @performance = Performance.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def performance_params
    params.require(:performance).permit(:name, :amount)
  end
end
