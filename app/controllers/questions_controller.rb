class QuestionsController < ApplicationController
  def top; end

  def get_movie
    @genrelist = ''

    @genrelist += '783' if params[:answer1] == 'Yes'

    @genrelist += '13335' if params[:answer2] == 'Yes'

    @start_year = if params[:answer3] == 'Yes'
                    'start_year=2018'
                  else
                    ''
                  end

    if params[:answer4] == 'Yes'
      @start_year = '&start_year=1980'
      @end_year = '&end_year=2021'
    else
      @start_year = ''
      @end_year = ''
    end

    if params[:answer5] == 'Yes'
      @genrelist += if @genrelist != ''
                      '%2C29'
                    else
                      '29'
                    end
    end

    if params[:answer6] == 'Yes'
      @genrelist += if @genrelist != ''
                      '%2C502675'
                    else
                      '502675'
                    end
    end

    if params[:answer7] == 'Yes'
      @genrelist += if @genrelist != ''
                      '%2C8711'
                    else
                      '8711'
                    end
    end

    if params[:answer8] == 'Yes'
      @genrelist += if @genrelist != ''
                      '%2C2340'
                    else
                      '2340'
                    end
    end

    if params[:answer9] == 'Yes'
      @genrelist += if @genrelist != ''
                      '%2C7442'
                    else
                      '7442'
                    end
    end

    url = URI("https://unogsng.p.rapidapi.com/search?genrelist=#{@genrelist}&type=movie#{@start_year}&orderby=rating&audiosubtitle_andor=and&start_rating=0&limit=1000&countrylist=267&audio=#{@language}&offset=0#{@end_year}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request['x-rapidapi-key'] = 'd7e9751546msh2daf837e0e220b7p11008bjsn3db46f5d0ef5'
    request['x-rapidapi-host'] = 'unogsng.p.rapidapi.com'

    response = http.request(request)
    @results = JSON.parse(response.body)

    if @results['total'] == 0
      url = URI("https://unogsng.p.rapidapi.com/search?type=movie&start_year=1972&orderby=rating&audiosubtitle_andor=and&limit=100&countrylist=267&offset=0&end_year=2019")
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(url)
      request['x-rapidapi-key'] = 'd7e9751546msh2daf837e0e220b7p11008bjsn3db46f5d0ef5'
      request['x-rapidapi-host'] = 'unogsng.p.rapidapi.com'
      response = http.request(request)
      @results = JSON.parse(response.body)
      @result = @results['results'].sample
    else
      @result = @results['results'].sample
    end

    @title = @result['title']
    @img = @result['img']
    @movie = Movie.new(title: @title, image: @img)

    redirect_to result_path if @movie.save
  end

  def result
    @movie = Movie.last
    @title = @movie.title
  end
end
