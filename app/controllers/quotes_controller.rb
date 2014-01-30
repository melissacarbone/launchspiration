class QuotesController < ApplicationController

  before_filter :authenticate_user!

  def index
    @rquote = Quote.random
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      redirect_to quotes_path, notice: 'Quote was successfully created!'
    else
      render 'new'
    end
  end

  def update
    @quote = Quote.find(params[:id])

    if @quote.update(quote_params)
      redirect_to @quote
    else
      render 'edit'
    end
  end


  private

  def quote_params
    params.require(:quote).permit(:content, :author, :cohort)
  end

end
