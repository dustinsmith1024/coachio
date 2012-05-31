class ProgressesController < ApplicationController
  before_filter :require_team
  # GET /progresses
  # GET /progresses.json
  def index
    @progresses = @goal.progresses.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @progresses }
    end
  end

  # GET /progresses/1
  # GET /progresses/1.json
  def show
    @progress = @goal.progresses.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @progress }
    end
  end

  # GET /progresses/new
  # GET /progresses/new.json
  def new
    @progress = @goal.progresses.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @progress }
    end
  end

  # GET /progresses/1/edit
  def edit
    @progress = @goal.progresses.find(params[:id])
  end

  # POST /progresses
  # POST /progresses.json
  def create
    @progress = @goal.progresses.new(params[:progress])

    respond_to do |format|
      if @progress.save
        format.html { redirect_to team_goal_progress_path(@team, @goal, @progress), notice: 'Progress was successfully created.' }
        format.json { render json: @progress, status: :created, location: @progress }
      else
        format.html { render action: "new" }
        format.json { render json: @progress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /progresses/1
  # PUT /progresses/1.json
  def update
    @progress = @goal.progresses.find(params[:id])

    respond_to do |format|
      if @progress.update_attributes(params[:progress])
        format.html { redirect_to team_goal_progress_path(@team, @goal, @progress), notice: 'Progress was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @progress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /progresses/1
  # DELETE /progresses/1.json
  def destroy
    @progress = @goal.progresses.find(params[:id])
    @progress.destroy

    respond_to do |format|
      format.html { redirect_to team_goal_progresses_url(@team, @goal) }
      format.json { head :no_content }
    end
  end
  
  def require_team
    @team = Team.find(params[:team_id])
    @goal = @team.goals.find(params[:goal_id])
  end
  
end
