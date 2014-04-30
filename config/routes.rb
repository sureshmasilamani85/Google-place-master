Project4::Application.routes.draw do
   root 'searches#home'
   get 'searches' => 'searches#set_places', as: 'get_places'
end
