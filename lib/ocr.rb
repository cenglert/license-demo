# ocr.rb
# encoding: utf-8
require 'rubygems'
require 'RMagick'
require 'tesseract'
class ProcessOCR
  
  
  def self.clean(text)
    
    #text.split(/\n/).compact.select { |v| v.size > 0 }
    #return text[/\w\d{4}-\d{5}-\d{5}/,1]
    clean_text = text.scan(/\w\d{4}-\d{5}-\d{5}/).last
    return clean_text
  end
  
  def self.process_image(image_file)
    engine = Tesseract::Engine.new do |config|
      config.language  = :eng
      config.blacklist = '|,*\'"'
    end
    
    img = Magick::Image::read(image_file).first
    eimg = img.enhance
    #gamma = img.gamma_correct(2.2)
    reduce = eimg.reduce_noise(2.0)
    resized = reduce.scale(640,640)

    grayscale = resized.quantize(16, Magick::GRAYColorspace)
    sharp = grayscale.sharpen(0.0, 2.0)
    gamma = sharp.gamma_correct(2.2)
    
    gamma.write Rails.root.join("public/images/grayscale.jpg")
    final_image = Rails.root.join("public/images/grayscale.jpg")
    drivers_license = self.clean(engine.text_for(final_image.to_s))
    return drivers_license
  end

end

#thumb = img.resize_to_fit(75, 75)

#puts clean(engine.text_for(ARGV.first))


#img = Image.new ARGV.first
#thumb = img.scale(640, 640)
#thumb.write "resize.png"


