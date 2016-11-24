class WelcomeController < ApplicationController

  def index
  end

  def file
    authorize! :edit, @question
    @question = Question.new
  end

  def upload
    @file = params[:question][:file]
    f = File.read(@file.path)
    @f = f.split("\nQ ")
    @f.each_with_index do |ans, ind|
      if ind == 0
        @test = ans
      else
        a = ans.split("\nA ")
        a.each_with_index do |aaa, index|
          if index == 0
            @question = Question.create(body: "#{aaa}")
            @test = Test.find(@test)
            @test.questions << @question
            @test.save
          else
            aaa.chomp!("\n")
            @correct = false
            if aaa[-1] == "+"
              @correct = true 
              aaa.chomp!("+")
            end
            @answer = @question.answers.create(body: "#{aaa}", correctly: @correct)
          end
        end
      end
    end
    redirect_to tests_path(@test)
  end

end
