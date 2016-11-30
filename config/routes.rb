Rails.application.routes.draw do
  resources :calendars
  resources :events
  resources :uploads
  root 'welcome#index'

  get 'my_teacher_schedule' => 'calendars#my_teacher_schedule'

  get 'uploads' => 'uploads#index'

  get 'student_uploads' => 'uploads#student_uploads'

  get 'student_show' => 'uploads#student_show'

  post 'create_upload_comment' => 'uploads#create_upload_comment'

  get 'delete_upload_comment' => 'uploads#delete_upload_comment'

  post 'edit_upload_comment' => 'uploads#edit_upload_comment'

  get 'new_student' => 'welcome#new_student'

  post 'create_student' => 'welcome#create_student'

  get 'new_teacher' => 'welcome#new_teacher'

  post 'create_teacher' => 'welcome#create_teacher'

  get 'student_uploads' => 'uploads#student_uploads'

  get 'mailbox/inbox' => 'mailbox#inbox', as: :mailbox_inbox
  get 'mailbox/sent' => 'mailbox#sent', as: :mailbox_sent
  get 'mailbox/trash' => 'mailbox#trash', as: :mailbox_trash

  devise_for :users

  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
  
end
