Rails.application.routes.draw do
  devise_for :users
  resources :pages
  resources :posts
  resources "contacts", only: [:new, :create]

  if Rails.env.production?
    constraints(:host => /^(?!myfancyapp\.com)/i) do
      match "/(*path)" => redirect {
           |params, req| "http://myfancyapp.com/#{params[:path]}"
       },  via: [:get, :post]
    end
  end

  get '/sitemap.xml.gz' => 'sitemaps#show'

  root to: 'pages#home'

  get '/blog' => redirect('posts#show')
  get '/posts' => 'posts#show'
  get '/smart-money-spending-guide-for-college-students' => redirect('/posts/smart-money-spending-guide-for-college-students')
  get '/nursing-as-a-second-career-the-unique-experience-that-older-nursing-students-bring-to-the-classroom' => redirect('/posts/nursing-as-a-second-career')
  get '/direct-bsmd-from-high-school-to-medical-school-sign-me-up' => redirect('/posts/direct-bsmd-from-high-school-to-medical-school-sign-me-up')
  get '/writing-tips-for-medical-school-admission-essays' => redirect('/posts/writing-tips-for-medical-school-admission-essays')
  get '/what-can-nursing-schools-do-to-attract-more-men' => redirect('/posts/what-can-nursing-schools-do-to-attract-more-men')
  get '/5-steps-crucial-to-get-into-medical-school' => redirect('/posts/5-steps-crucial-to-get-into-medical-school')
  get '/a-window-into-the-life-of-a-traveling-clinical-psychologist' => redirect('/posts/a-window-into-the-life-of-a-traveling-clinical-psychologist')
  get '/career-comparison-shopping-with-locum-tenens-positions' => redirect('/posts/career-comparison-shopping-with-locum-tenens-positions')
  get '/medical-students-with-disabilities-can-succeed' => redirect('/posts/medical-students-with-disabilities-can-succeed')
  get '/medical-schools-shorter-curriculum' => redirect('/posts/medical-schools-shorter-curriculum')
  get '/type-premed-you' => redirect('/posts/type-premed-you')
  get '/obamacare-means-medical-students' => redirect('/posts/obamacare-means-medical-students')
  get '/admissions-officers-support-mcat' => redirect('/posts/admissions-officers-support-mcat')
  get '/residency-accreditation-groups-unified' => redirect('/posts/residency-accreditation-groups-unified')
  get '/medical-schools-applicants-minority-enrollment' => redirect('/posts/medical-schools-applicants-minority-enrollment')
  get '/primary-care-check-national-health-service-corps' => redirect('/posts/primary-care-check-national-health-service-corps')
  get '/medical-school-breaking-ground-michigan' => redirect('/posts/medical-school-breaking-ground-michigan')
  get '/top-10-medical-legal-cases-medical-student-about-learn' => redirect('/posts/top-10-medical-legal-cases-medical-student-about-learn')
  get '/medical-student-question-jess' => redirect('/posts/medical-student-question-jess')
  get '/medical-school-early-decision' => redirect('/posts/medical-school-early-decision')
  get '/5-reasons-social-media-good-pre-meds' => redirect('/posts/5-reasons-social-media-good-pre-meds')
  get '/content' => redirect('/posts/content')
  get '/welcome' => redirect('/posts/welcome')

  get '/high-school-to-medical-school' => redirect('/pages/high-school-to-medical-school')
  get '/high-school-to-medical-school/is-medicine-for-me' => redirect('/pages/is-medicine-for-me')
  get '/high-school-to-medical-school/high-school-courses-for-medical-school' => redirect('/pages/high-school-courses-for-medical-school')
  get '/high-school-to-medical-school/pre-med-colleges-degrees' => redirect('/pages/premed-colleges-degrees')
  get '/high-school-to-medical-school/seven-year-medical-programs' => redirect('/pages/seven-year-medical-programs')

  get '/pre-med' => redirect('pages/pre-med')
  get '/pre-med/pre-med-major-and-courses' => redirect('/pages/pre-med-major-and-courses')
  get '/pre-med/mcat-prep' => redirect('/pages/mcat-prep')
  get '/pre-med/mcat-prep/write-mcat-writing-essays' => redirect('/pages/write-mcat-writing-essays')
  get '/pre-med/what-is-medical-school-like-student' => redirect('/pages/what-is-medical-school-like-student')
  get '/pages/pre-med-colleges-degrees' => redirect('/pages/premed-colleges-degrees')

  get '/applying-to-medical-school' => redirect('/pages/applying-to-medical-school')
  get '/applying-to-medical-school/medical-school-requirements' => redirect('/pages/medical-school-requirements')
  get '/applying-to-medical-school/medical-school-statistics' => redirect('/pages/medical-school-statistics')
  get '/applying-to-medical-school/how-to-write-a-medical-school-personal-statement' => redirect('/pages/how-to-write-a-medical-school-personal-statement')
  get '/applying-to-medical-school/how-to-write-a-medical-school-personal-statement/medical-school-personal-statement-example' => redirect('/pages/medical-school-personal-statement-example')
  get '/applying-to-medical-school/medical-school-recommendation-letters' => redirect('/pages/medical-school-recommendation-letters')
  get '/applying-to-medical-school/amcas-medical-school-application' => redirect('/pages/applying-to-medical-school/amcas-medical-school-application')
  get '/applying-to-medical-school/medical-school-secondary-application-essays' => redirect('/pages/medical-school-secondary-application-essays')
  get '/applying-to-medical-school/medical-school-interview' => redirect('/pages/medical-school-interview')
  get '/applying-to-medical-school/how-to-choose-a-medical-school' => redirect('/pages/how-to-choose-a-medical-school')
  get '/applying-to-medical-school/list-of-accredited-medical-schools' => redirect('/pages/list-of-accredited-medical-schools')
  get '/accepted-to-medical-school/list-of-accredited-medical-schools' => redirect('/pages/list-of-accredited-medical-schools')

  get '/alternative-to-medical-school' => redirect('/pages/alternative-to-medical-school')
  get '/alternative-to-medical-school/reapplying-to-medical-school' => redirect('/pages/reapplying-to-medical-school')
  get '/alternative-to-medical-school/caribbean-medical-schools' => redirect('/pages/caribbean-medical-schools')
  get '/alternative-to-medical-school/caribbean-medical-schools/list-of-accredited-caribbean-medical-schools' => redirect('/pages/list-of-accredited-caribbean-medical-schools')
  get '/alternative-to-medical-school/osteopathic-medical-schools-and-what-is-osteopathy' => redirect('/pages/osteopathic-medical-schools-and-what-is-osteopathy')
  get '/alternative-to-medical-school/osteopathic-medical-schools-and-what-is-osteopathy/list-of-accredited-osteopathic-medical-schools' => redirect('/pages/list-of-accredited-osteopathic-medical-schools')

  get '/health-careers' => redirect('/pages/health-careers')
  get '/health-careers/allergy-and-immunology' => redirect('/pages/allergy-and-immunology')
  get '/health-careers/anesthesiology-career-guide' => redirect('/pages/anesthesiology-career-guide')
  get '/health-careers/cardiology' => redirect('/pages/cardiology')
  get '/health-careers/dermatology-career-guide' => redirect('/pages/dermatology-career-guide')
  get '/health-careers/emergency-medicine-career-guide' => redirect('/pages/emergency-medicine-career-guide')
  get '/health-careers/endocrinology-career-guide' => redirect('/pages/endocrinology-career-guide')
  get '/health-careers/family-medicine-career-guide' => redirect('/pages/family-medicine-career-guide')
  get '/health-careers/gastroenterology-career-guide' => redirect('/pages/gastroenterology-career-guide')
  get '/health-careers/general-surgery-career-guide' => redirect('/pages/general-surgery-career-guide')
  get '/health-careers/internal-medicine-career-guide' => redirect('/pages/internal-medicine-career-guide')
  get '/health-careers/medical-geneticist-career-guide' => redirect('/pages/medical-geneticist-career-guide')
  get '/health-careers/nephrology-career-guide' => redirect('/pages/nephrology-career-guide')
  get '/health-careers/neurology-career-guide' => redirect('/pages/neurology-career-guide')
  get '/health-careers/nuclear-medicine-career-guide' => redirect('/pages/nuclear-medicine-career-guide')
  get '/health-careers/obstetrics-gynecology-career-guide' => redirect('/pages/obstetrics-gynecology-career-guide')
  get '/health-careers/oncology-career-guide' => redirect('/pages/oncology-career-guide')
  get '/health-careers/ophthalmology-career-guide' => redirect('/pages/ophthalmology-career-guide')
  get '/health-careers/orthopedic-surgery-career-guide' => redirect('/pages/orthopedic-surgery-career-guide')
  get '/health-careers/otolaryngology-career-guide' => redirect('/pages/otolaryngology-career-guide')
  get '/health-careers/pathology-career-guide' => redirect('/pages/pathology-career-guide')
  get '/health-careers/pediatrics-career-guide' => redirect('/pages/pediatrics-career-guide')
  get '/health-careers/pulmonology-career-guide' => redirect('/pages/pulmonology-career-guide')

  match '/contacts',     to: 'contacts#new',             via: 'get'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
