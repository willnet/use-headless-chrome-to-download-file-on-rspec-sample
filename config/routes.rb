Rails.application.routes.draw do
  root 'welcome#index'
  get 'css' => 'welcome#css'
end
