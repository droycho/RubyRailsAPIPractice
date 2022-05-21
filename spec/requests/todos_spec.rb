# require 'rails_helper'

# RSpec.describe "Todos", type: :request do
#   describe "GET /index" do
#     pending "add some examples (or delete) #{__FILE__}"
#     # skip
#   end
#   #0. Initialize test data
#   #create a list of 10 TODO models
#   let!(:todos) {create_list(:todo, 10)}
#   #obtain id of first TODO in list
#   let(:todo_id) {todos.first.id}

#   #1. Test suite for GET /todos
#   describe "GET /todos" do
#     #make HTTP get request before each example
#     before {get '/todos'}
#     #if the get request returns a todo list...
#     it 'returns todos' do
#       #parse the JSON response and make sure its not empty
#       expect(json).not_to be_empty
#       #parse JSON again and make sure its size it 10
#       # expect(json).to eq(10)
#     end
#     #if the get request has an error...
#     it 'returns status code 200' do
#       expect(response).to have_http_status(200)
#     end
#   end

#   #2. Test suite for GET /todos/:id
#   describe 'GET /todos/:id' do
#     #make HTTP get request before each example
#     before {get "/todos/#{todo_id}"}
#     #run the test if the TODO record with the given id exists
#     context 'when the record exists' do
#       #check valid return...
#       it 'returns the todo' do
#         #make sure its not empty
#         expect(json).not_to be_empty
#         #make sure the id's match
#         expect(json['id']).to eq(todo_id)
#       end
#       it 'returns status code 200' do
#         expect(response).to have_http_status(200)
#       end
#     end
#     context 'when the record does not exist' do
#       let(:todo_id) {100}
#       it 'returns status code 404' do
#         expect(response).to have_http_status(404)
#       end
#       it 'returns a not found message' do
#         expect(response.body).to match(/Couldn't find Todo/)
#       end
#     end
#   end

#   #3. Test suite for POST /todos
#   describe 'POST /todos' do
#     #create an example valid payload
#     let(:valid_attributes) {{title: 'Learn Elm', created_by: '10'}}
#     #check request is VALID
#     context 'when the request is valid' do
#       before {post '/todos', params: valid_attributes}
#       #verify a TODO record was created
#       it 'creates a todo' do
#         #check title match
#         expect(json['title']).to eq('Learn Elm')
#       end
#       #if TODO record failed...
#       it 'returns status code 201' do
#         expect(response).to have_http_status(201)
#       end
#     end
#     #when the request is INVALID
#     context 'when the request is invalid' do
#       before {post '/todos', params: {title: 'Foobar'}}
#       it 'returns status code 422' do
#         expect(response).to have_http_status(422)
#       end
#       it 'returns a validation failure message' do
#         expect(response.body).to match(/Validation failed: Created by can't be blank/)
#       end
#     end
#   end

#   #4. Test suite for PUT /todos/:id
#   describe 'PUT /todos/:id' do
#     #create sample valid data
#     let(:valida_attributes) {{title: 'Shopping'}}
#     #check if record exists...
#     context 'when the record exists' do
#       #attempt put...
#       before {put "/todos/#{todo_id}", params: valid_attributes}
#       #check successful put
#       it 'updates the record' do
#         expect(response.body).to be_empty
#       end
#       #if not successful
#       it 'returns status code 204' do
#         expect(response).to have_http_status(204)
#       end
#     end
#   end

#   #5. Test suite for DELETE /todos/:id
#   describe 'DELETE /todos/:id' do
#     #attempt deletion of record with id
#     before {delete "/todos/#{todo_id}"}
#     #if not successful
#     it 'returns status code 204' do
#       expect(response).to have_http_status(204)
#     end
#   end
# end
require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  # initialize test data
  let!(:todos) { create_list(:todo, 10) }
  let(:todo_id) { todos.first.id }

  # Test suite for GET /todos
  describe 'GET /todos' do
    # make HTTP get request before each example
    before { get '/todos' }

    it 'returns todos' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /todos/:id
  describe 'GET /todos/:id' do
    before { get "/todos/#{todo_id}" }

    context 'when the record exists' do
      it 'returns the todo' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(todo_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:todo_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Todo/)
      end
    end
  end

  # Test suite for POST /todos
  describe 'POST /todos' do
    # valid payload
    let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }

    context 'when the request is valid' do
      before { post '/todos', params: valid_attributes }

      it 'creates a todo' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/todos', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  # Test suite for PUT /todos/:id
  describe 'PUT /todos/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/todos/#{todo_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /todos/:id
  describe 'DELETE /todos/:id' do
    before { delete "/todos/#{todo_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end