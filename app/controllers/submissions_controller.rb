class SubmissionsController < ApplicationController
 
  def index
    #@user = nil
    # Sets user to nil, then searches for submissions of a particular user if user_id is not blank
    if params[:user_id].blank?
      @submissions = Submission.all
    else
      @user = User.find(params[:user_id])
      @submissions = Submission.find_all_by_user_id(@user.id)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @submissions }
    end
  end

  # GET /submissions/1
  # GET /submissions/1.xml
  def show
    @submission = Submission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @submission }
    end
  end

  # GET /submissions/new
  # GET /submissions/new.xml
  def new
    get_user
    @submission = Submission.new
  end

  # GET /submissions/1/edit
  def edit
    @submission = Submission.find(params[:id])
  end

  # POST /submissions
  # POST /submissions.xml
  def create
    get_user
    @submission = Submission.new(params[:submission])
    @submission.user_id = @user.id
    @submission.netid = @user.netid
      if @submission.save
        flash[:notice] = 'Submission was successfully created.'
        redirect_to @user
      else
        render :action => "new" 
      end
    end

  # PUT /submissions/1
  # PUT /submissions/1.xml
  def update
    @submission = Submission.find(params[:id])

    respond_to do |format|
      if @submission.update_attributes(params[:submission])
        format.html { redirect_to(@submission, :notice => 'Submission was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @submission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.xml
  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to(submissions_url) }
      format.xml  { head :ok }
    end
  end


private

  def get_user
    @user = User.find(params[:user_id])
  end
  
end