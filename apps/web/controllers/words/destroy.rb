module Web::Controllers::Words
  class Destroy
    include Web::Action

    expose :word

    def call(params)
      @word = WordRepository.new.delete(params[:id])

      redirect_to '/'       
    end
  end
end
