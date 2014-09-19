RSpec.feature 'Team info' do
  scenario 'Show the initial select form' do
    visit '/'

    expect(current_path).to eq root_path

    expect(page).to have_text 'Team Info'
    expect(page).to have_field 'Select team'
    expect(page).to have_button 'Show'
    expect(page).to have_text 'No team is selected'
  end

  scenario 'Show an info for the selected team' do
    visit '/'

    expect(current_path).to eq root_path

    select 'Aston_Villa', from: 'Select team'

    expect(page).to have_text '8. Aston_Villa 46-47'
  end
end
