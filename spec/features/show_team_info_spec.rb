RSpec.feature 'Team info' do
  scenario 'Show the initial select form' do
    visit '/'

    expect(current_path).to eq root_path

    expect(page).to have_field 'Select team'
    expect(page).to have_button 'Show'
    expect(page).to have_text 'No team is selected'
  end

  scenario 'Show an info for the selected team' do
    pending 'still not implemented'
  end
end
