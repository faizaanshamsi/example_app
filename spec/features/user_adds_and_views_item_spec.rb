require 'rails_helper'

feature "User adds and views item" do

# Acceptance Criteria:
# -[ ] Item must have a name
# -[ ] Item must have a description

  scenario 'user adds item' do
    item = Item.new(title: "Item", description: "What a great item!")

    user = User.create(email: "email@email.com", encrypted_password: "alsfjsdlk322fkj2lfk3fjwlfwjlfkjlfj3kjlk2j", username: "faizaan")

    sign_in_as(user)

    visit new_item_path

    fill_in 'Title', with: item.title
    fill_in 'Description', with: item.description
    click_on 'Create Item'

    expect(page).to have_content("Item")
    expect(page).to have_content("What a great item!")
  end

  scenario 'user not signed in' do
    visit new_item_path
    save_and_open_page
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end

  scenario 'user does not provide necessary info' do
    sign_in_as(user)

    visit new_item_path

    click_on 'Create Item'

    expect(page).to have_content("can't be blank")
  end

end
