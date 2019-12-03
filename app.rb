require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  
  get '/reversename/:name' do
    @reverse_name = params[:name].reverse
    # @reverse_name.reverse
  end
  
  get '/square/:number' do
    @square_num = params[:number].to_i
    (@square_num * @square_num).to_s
  end
  
  get '/say/:number/:phrase' do
    @say_number = params[:number].to_i
    @say_phrase = params[:phrase]
    @say_phrase * @say_number
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @word1 = params[:word1]
    @word2 = params[:word2]
    @word3 = params[:word3]
    @word4 = params[:word4]
    @word5 = params[:word5]
    "#{@word1} #{@word2} #{@word3} #{@word4} #{@word5}".concat + "."
  end
  
  get '/:operation/:number1/:number2' do
    @operation = params[:operation]
    @number1 = params[:number1].to_i
    @number2 = params[:number2].to_i
    
    case @operation
    when "add"
      @operation = '+'
    when "subtract"
      @operation = '-'
    when "multiply"
      @operation = '*'
    when "divide"
      @operation = '/'
    else
      "Unknown math operation. Please add, sub, mult, or div."
    end
    (@number1.method(@operation).(@number2)).to_s
    
  end
end