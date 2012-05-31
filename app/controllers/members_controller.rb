class MembersController < ApplicationController
  # GET /members
  # GET /members.json
  def index
    @team = Team.find(params[:team_id])
    @members = @team.members

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @team = Team.find(params[:team_id])
    @member = @team.members.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/new
  # GET /members/new.json
  def new
    @team = Team.find(params[:team_id])
    @member = @team.members.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/1/edit
  def edit
    @team = Team.find(params[:team_id])
    @member = @team.members.find(params[:id])
  end

  # POST /members
  # POST /members.json
  def create
    @team = Team.find(params[:team_id])
    @member = @team.members.new(params[:member])

    respond_to do |format|
      if @member.save
        format.html { redirect_to team_members_path(@team), notice: 'member was successfully created.' }
        format.json { render json: @member, status: :created, location: @member }
      else
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @team = Team.find(params[:team_id])
    @member = @team.members.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to team_members_path(@team), notice: 'member was successfully created.' }
        #format.html { redirect_to @member, notice: 'member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end
end
