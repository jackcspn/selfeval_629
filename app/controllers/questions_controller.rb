class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end
  
  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
    #javascript_include_tag('question.js')
  end

  # POST /questions
  # POST /questions.json
  def create
    if params[:question][:qtype] == "True or False"
      @question = Question.new()
      @question.qtype = params[:question][:qtype]
      @question.topic = params[:question][:topic]
      @question.content = params[:question][:content]
      @question.option1 = 'True'
      @question.option2 = 'False'
      @question.option3 = 'nil'
      @question.option4 = 'nil'
      @question.answer = params[:question][:answer]
      @question.explanation = params[:question][:explanation]
      #if @question.answer == "True" or @question.answer == "true"
      #  @question.answer = "option1"
      #else
      #  @question.answer = "option2"
      #end
      @question.image = params[:question][:image] 
    else
      @question = Question.new(question_params)
    end
    
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    if params[:question][:remove_question_image] == "1"
      @question.remove_image = true
      if params[:question][:topic] != nil
        params[:question][:topic] = params[:question][:topic]
      end
      if params[:question][:qtype] == "True or False"
        params[:question][:option1] = 'True'
        params[:question][:option2] = 'False'
        params[:question][:option3] = 'nil'
        params[:question][:option4] = 'nil'
      end
      @question.update(question_params)
    else
      if params[:question][:topic] != nil
        params[:question][:topic] = params[:question][:topic]
      end
      if params[:question][:qtype] == "True or False"
        params[:question][:option1] = 'True'
        params[:question][:option2] = 'False'
        params[:question][:option3] = 'nil'
        params[:question][:option4] = 'nil'
      end
      @question.update(question_params)
    end
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:qtype, :topic, :content, :image, :option1, :option2, :option3, :option4, :answer, :explanation)
    end
    
    def image_remove_params
      params.require(:question).permit(:remove_question_image)
    end
end