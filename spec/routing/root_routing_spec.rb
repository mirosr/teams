RSpec.describe 'Root route' do
  it 'routes to /' do
    expect(get: '/').to route_to(controller: 'team', action: 'index')
  end
end
