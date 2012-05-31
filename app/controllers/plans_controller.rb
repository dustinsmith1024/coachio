class PlansController < ApplicationController
  # GET /plans
  # GET /plans.json
  def index
    @team = Team.find(params[:team_id])
    @workout = @team.workouts.find(params[:workout_id])
    @plans = @workout.plans
    puts 'hiii'
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @plans }
    end
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
    @team = Team.find(params[:team_id])
    @plan = @team.plans.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plan }
    end
  end

  # GET /plans/new
  # GET /plans/new.json
  def new
    @team = Team.find(params[:team_id])
    @plan = Plan.new
    @workout = @team.workouts.find(params[:workout_id])
    @activities = @team.activities

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @plan }
    end
  end

  # GET /plans/1/edit
  def edit
    @team = Team.find(params[:team_id])
    @plan = Plan.find(params[:id])
  end

  # POST /plans
  # POST /plans.json
  def create
    @team = Team.find(params[:team_id])
    @workout = @team.workouts.find(params[:workout_id])
    @plan = @workout.plans.new(params[:plan])

    respond_to do |format|
      if @plan.save
        format.html { redirect_to team_workout_plans_path(@team, @workout), notice: 'plan was successfully created.' }
        format.json { render json: @plan, status: :created, location: @plan }
      else
        format.html { render action: "new" }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /plans/1
  # PUT /plans/1.json
  def update
    @team = Team.find(params[:team_id])
    @workout = @team.workouts.find(params[:workout_id])
    @plan = @workout.plans.find(params[:plan])
    #@plan = @team.plans.find(params[:id])

    respond_to do |format|
      if @plan.update_attributes(params[:plan])
        format.html { redirect_to team_workout_plan_path(@team, @workout, @plan), notice: 'plan was successfully created.' }
        #format.html { redirect_to @plan, notice: 'plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @team = Team.find(params[:team_id])
    @workout = @team.workouts.find(params[:workout_id])
    @plan = @workout.plans.find(params[:id])
    @plan.destroy

    respond_to do |format|
      format.html { redirect_to team_workout_plans_path(@team, @workout) }
      format.json { head :no_content }
    end
  end
end
