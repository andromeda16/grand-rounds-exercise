
describe 'the Grand Rounds web site' do

  describe 'navigation from header and footer' do
    context 'with page object' do
      let(:main_page) {MainPage.new}

      before(:each) do
        main_page.load
      end

      it 'navigates to the members page from header' do
        expect(main_page).to be_displayed
        members_page = main_page.header.open_members_page
        expect(members_page).to be_displayed
      end

      it 'navigates to the members page from footer' do
        expect(main_page).to be_displayed
        members_page = main_page.footer.open_members_page
        expect(members_page).to be_displayed
      end
    end
  end
end