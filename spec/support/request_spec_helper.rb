#Used by the TODO API for parsing JSON data (spec/requests/todo_spec.rb)
module RequestSpecHelper
    #Parse JSON response to ruby hash
    def json
        JSON.parse(response.body)
    end
end