Rails.application.routes.draw do
  get 'gossips/:id', to: 'gossips#page'
  get 'gossips/user/:id', to: 'gossips#user'

  get 'team/contact', to: 'team#contact'
  get 'team/', to: 'team#team'

  get 'welcome/page/:first_name', to: 'welcome#page'
  get 'welcome/page/', to: 'welcome#page'
  get '/', to: 'welcome#page'

  get 'pages/home'
end
