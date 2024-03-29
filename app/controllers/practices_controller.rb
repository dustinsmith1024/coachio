class PracticesController < ApplicationController
  # GET /practices
  # GET /practices.json
  def index
    @team = Team.find(params[:team_id])
    @workout = @team.workouts.find(params[:workout_id])
    @practices = @workout.practices

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @practices }
    end
  end

  # GET /practices/1
  # GET /practices/1.json
  def show
    @team = Team.find(params[:team_id])
    @workout = @team.workouts.find(params[:workout_id])
    @practice = @workout.practices.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @practice }
    end
  end

  # GET /practices/new
  # GET /practices/new.json
  def new
    @team = Team.find(params[:team_id])
    @workouts = @team.workouts
    @workout = @team.workouts.find(params[:workout_id])
    @practice = @workout.practices.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @practice }
    end
  end

  # GET /practices/1/edit
  def edit
    @team = Team.find(params[:team_id])
    @workouts = @team.workouts
    @workout = @team.workouts.find(params[:workout_id])
    @practice = @workout.practices.find(params[:id])
  end

  # GET /practices/1/edit
  def complete
    @team = Team.find(params[:team_id])
    @workouts = @team.workouts
    @workout = @team.workouts.find(params[:workout_id])
    @practice = @workout.practices.find(params[:id])
    @practice.complete = true
    @workout.plans.each do |p|
      puts p
      @practice.results.build(:plan_id => p.id)
    end
    puts @practice.results
  end

  # POST /practices
  # POST /practices.json
  def create
    @team = Team.find(params[:team_id])
    @workout = @team.workouts.find(params[:workout_id])
    @practice = @workout.practices.new(params[:practice])
    @practice.team = @team

    respond_to do |format|
      if @practice.save
        format.html { redirect_to team_workout_practices_path(@team, @workout), notice: 'Practice was successfully created.' }
        format.json { render json: @practice, status: :created, location: @practice }
      else
        format.html { render action: "new" }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /practices/1
  # PUT /practices/1.json
  def update
    @team = Team.find(params[:team_id])
    @workout = @team.workouts.find(params[:workout_id])
    @practice = @workout.practices.find(params[:id])

    respond_to do |format|
      if @practice.update_attributes(params[:practice])
        format.html { redirect_to team_workout_practices_path(@team, @workout), notice: 'Practice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /practices/1
  # DELETE /practices/1.json
  def destroy
    @team = Team.find(params[:team_id])
    @workout = @team.workouts.find(params[:workout_id])
    @practice = @workout.practices.find(params[:id])
    @practice.destroy

    respond_to do |format|
      format.html { redirect_to team_workout_practices_url(@team, @workout) }
      format.json { head :no_content }
    end
  end
end
