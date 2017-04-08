module ScoresHelper
	def check_save(scores)
		saved = true
		scores.each do |score|
			if !score.save 
				saved = false
			end
		end
		if saved == false
			scores.each do |score|
				score.destroy
			end
		end
		saved
	end

end
