Rails.application.routes.draw do
#  scope '/hoge' do
#    get '/fuga', controller: :hoge, action: :fuga
#  end

  def namespaced_scope(path, add_namespace: nil, module_name: nil, &block)
    scope path, &block
    scope add_namespace, module: module_name, as: module_name  do
      scope path, &block
    end
  end

  def scope_with_smartphone(path, &block)
    scope path, &block
    scope '/sp', module: :smartphone, as: :smartphone  do
      scope path, &block
    end
  end

  namespaced_scope '/hoge', add_namespace: :sp, module_name: :smartphone do
    get '/fuga', controller: :hoge, action: :fuga
  end

  scope_with_smartphone 'fuga' do
    resources :piyo
  end
end
