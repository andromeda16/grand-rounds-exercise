require 'helpers/javascript_executor'

include JavascriptExecutor

describe 'Grand Rounds web site' do

  describe 'on Top Header' do
    context 'with page object' do
      let(:main_page) {MainPage.new}

      before do
        main_page.load
      end

      it 'checks header is persistent at the top of the page when scrolling' do
        expect(main_page).to be_displayed
        expect(main_page.header).to be_visible
        expect(get_css_property(main_page.header, 'position')).to eq('fixed')
        expect(get_bounding_rect_property(main_page.header, 'top')).to eq(0)
        expect(get_bounding_rect_property(main_page.header, 'left')).to eq(0)

        scroll_to(main_page.footer)

        expect(get_bounding_rect_property(main_page.header, 'top')).to eq(0)
        expect(get_bounding_rect_property(main_page.header, 'left')).to eq(0)
      end

      it 'validates animation of the loading indicators on the \'Get Quality That Counts\' section' do
        expect(main_page).to be_displayed
        expect(main_page.quality_section.circle_charts.size).to eq 4
        expect(main_page.quality_section.circle_charts.map {|c| c.text}).to eq ['', '', '', '']
        expect(main_page.quality_section.circle_charts.map {|c| c.bars.size}).to eq [0, 0, 0, 0]

        scroll_to(main_page.quality_section)

        expected_percents = [50, 75, 40, 100]
        expected_bars_per_full_circle = 36
        expected_bars_num = expected_percents.map {|p| p == 100 ? expected_bars_per_full_circle : (expected_bars_per_full_circle * p / 100.to_f).ceil}

        (0...expected_bars_num.size).each {|i|
          main_page.quality_section.circle_charts[i].has_bars? :count => expected_bars_num[i]
        }
        expect(main_page.quality_section.circle_charts.map {|c| c.bars.size}).to eq expected_bars_num
        expect(main_page.quality_section.circle_charts.map {|c| c.text}).to eq expected_percents.map {|p| "#{p}%"}
      end
    end
  end
end