feature "adds movie" do
  before(:each) do
    reset_csv
  end

  scenario "navigates to new movie form from index" do
    visit "/"

    click_link "Add A Movie"

    expect(page).to have_content("Add a movie here!")
    expect(page).to have_current_path("/movies/new")
  end

  scenario "user provides title, release year, runtime" do
    visit "/movies/new"

    fill_in "title", with: "Lion King"
    fill_in "release_year", with: "1994"
    fill_in "runtime", with: "89"

    click_button "Submit"

    expect(page).to have_content("Lion King")
    expect(page).to have_content("1994")
    expect(page).to have_content("89")
  end

  scenario "user doesn't provide a title" do
    visit "/movies/new"

    fill_in "release_year", with: "1994"
    fill_in "runtime", with: "89"

    click_button "Submit"

    expect(page).to have_content("Error!")
    expect(page).to have_content("Please provide a title")
    expect(page).to have_current_path("/movies/new")
  end

end
