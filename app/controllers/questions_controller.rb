class QuestionsController < ApplicationController
  # 質問一覧表示
  def index
    @questions = Question.all
  end

  # 質問詳細ページの表示
  def show
    # p.to_param[:id]
    @question = Question.find(params[:id])
  end

  # 質問の作成
  def new
    @question = Question.new
  end

  # 質問の登録
  def create
    # Questionモデルを初期化
    @question = Question.new(question_params)
    # QuestionモデルをDBに保存
    if @question.save
      # showへリダイレクト
      redirect_to @question
    else
      render "new",  status: :unprocessable_entity
    end

  end

  # 質問の編集
  def edit
    @question = Question.find(params[:id])
  end

  # 質問の更新
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to
    else
      render "edit",  status: :unprocessable_entity
    end
  end

  # 質問の削除
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path  # トップページに移動
  end

  private
  def question_params
    params.require(:question).permit(:title, :name, :content)   # データベースに保存する処理を指定
  end
end
