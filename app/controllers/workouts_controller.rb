class WorkoutsController < ApplicationController
  # GET /workouts
  # GET /workouts.json
  def index
    @team = Team.find(params[:team_id])
    @workouts = @team.workouts

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workouts }
    end
  end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
    @team = Team.find(params[:team_id])
    @workout = @team.workouts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workout }
    end
  end

  # GET /workouts/new
  # GET /workouts/new.json
  def new
    @team = Team.find(params[:team_id])
    @workout = @team.workouts.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workout }
    end
  end

  # GET /workouts/1/edit
  def edit
    @team = Team.find(params[:team_id])
    @workout = @team.workouts.find(params[:id])
    @activities = @team.activities
    
  end

  # POST /workouts
  # POST /workouts.json
  def create
    @team = Team.find(params[:team_id])
    @workout = @team.workouts.new(params[:workout])

    respond_to do |format|
      if @workout.save
        format.html { redirect_to team_workouts_path(@team), notice: 'workout was successfully created.' }
        format.json { render json: @workout, status: :created, location: @workout }
      else
        format.html { render action: "new" }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workouts/1
  # PUT /workouts/1.json
  def update
    @team = Team.find(params[:team_id])
    @workout = @team.workouts.find(params[:id])

    respond_to do |format|
      if @workout.update_attributes(params[:workout])
        format.html { redirect_to team_workout_path(@team, @workout), notice: 'workout was successfully created.' }
        #format.html { redirect_to @workout, notice: 'workout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout = workout.find(params[:id])
    @workout.destroy

    respond_to do |format|
      format.html { redirect_to workouts_url }
      format.json { head :no_content }
    end
  end
end
