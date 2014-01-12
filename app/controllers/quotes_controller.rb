class QuotesController < ApplicationController

  def index
    @rquote = Quote.find_by_id(rand(Quote.count)+1)
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to quotes_path
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
