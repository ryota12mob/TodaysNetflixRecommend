class QuestionsController < ApplicationController
    def top;end

    def get_movie

        @genrelist = ""

        if params[:answer1] == "Yes"
            @genrelist += "783"
        end

        if params[:answer2] == "Yes"
            @language = "japanese"
        else
            @language = "english"
        end

        if params[:answer3] == "Yes"
            @start_year = "start_year=2018"
        else
            @start_year = ""
        end

        if params[:answer4] == "Yes"
            @start_year = "&start_year=1980"
            @end_year = "&end_year=2021"
        else
            @start_year = ""
            @end_year = ""
        end

        if params[:answer5] == "Yes"
            if @genrelist != ""
                @genrelist += "%2C29"
            else
                @genrelist += "29"
            end
        end

        if params[:answer6] == "Yes"
            if @genrelist != ""
                @genrelist += "%2C502675"
            else
                @genrelist += "502675"
            end
        end

        if params[:answer7] == "Yes"
            if @genrelist != ""
                @genrelist += "%2C8711"
            else
                @genrelist += "8711"
            end
        end

        if params[:answer8] == "Yes"
            if @genrelist != ""
                @genrelist += "%2C2340"
            else
                @genrelist += "2340"
            end
        end

        if params[:answer9] == "Yes"
            if @genrelist != ""
                @genrelist += "%2C7442"
            else
                @genrelist += "7442"
            end
        end


        url = URI("https://unogsng.p.rapidapi.com/search?genrelist=#{@genrelist}&type=movie#{@start_year}&orderby=rating&audiosubtitle_andor=and&start_rating=0&limit=1000&subtitle=#{@language}&countrylist=267&audio=#{@language}&offset=0#{@end_year}")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = 'd7e9751546msh2daf837e0e220b7p11008bjsn3db46f5d0ef5'
        request["x-rapidapi-host"] = 'unogsng.p.rapidapi.com'

        response = http.request(request)
        @results = JSON.parse(response.body)
        @result = @results["results"].sample
        @title = @result["title"]
        @img = @result["img"]
        @movie = Movie.new(title: @title, image: @img)

        if @movie.save
            redirect_to result_path
        end
    end

    def result
        @movie = Movie.last
    end
end
