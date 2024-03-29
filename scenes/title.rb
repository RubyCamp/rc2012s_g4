# coding: utf-8

class Title
  def initialize
    bg_file = File.join(File.dirname(__FILE__), "..", "images", "start.png")
    @background_img = Image.load(bg_file)
    music = File.join(File.dirname(__FILE__), "..", "sound", "opening.wav")
  	@opening_sound = Sound.new(music)
		@music_played = 0
    
    @pushed_space = false
    @alpha = 255
  end

  def play
  	if @music_played  == 0
			@opening_sound.play
			@music_played = 1
		end

  	if Input.keyPush?(K_SPACE)
      @pushed_space = true
    end

    if @pushed_space
      @alpha -= 4
      if @alpha <= 0
        @alpha = 0
      end
      Window.drawAlpha(100, 0, @background_img, @alpha)
      if @alpha <= 0
        Scene.set_scene(:game)
      end
    else
      Window.draw(100, 0, @background_img)
    end
  end
end
