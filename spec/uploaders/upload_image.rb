require 'carrierwave/test/matchers'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  let(:question) { {qtype: "True or False", answer: "option2", content: "Question?", option1: "True", option2: "False", option3: "nil", option4: "nil"} }
  let(:uploader) { ImageUploader.new(question, :image) }

  before do
    ImageUploader.enable_processing = true
    File.open('spec/support/1.jpeg') { |f| uploader.store!(f) }
  end

  after do
    ImageUploader.enable_processing = false
    uploader.remove!
  end

  context 'the thumb version' do
    it "scales down a landscape image to be exactly 64 by 64 pixels" do
      expect(question_image.thumb).to have_dimensions(300, 300)
    end
  end

  it "has the correct format" do
    expect(uploader).to be_format('jpeg')
  end
end