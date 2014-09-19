RSpec.describe 'Team route' do
  it 'routes to /team with GET' do
    expect(get: '/team').to route_to(controller: 'team', action: 'index')
  end

  it 'routes to /team/fetch with POST' do
    expect(post: '/team/fetch').to route_to(controller: 'team', action: 'fetch')
  end
end
