namespace :votes do
  @candidates = []
  @campaigns = []
  
  task :import, [:filename] => :environment  do |t,args|
    file = File.new(args[:filename],'r')
    i = 0
    while (line = file.gets)
      i += 1
      puts i
      if parsed = parse_line(line)
        vote = Vote.create
        vote.candidate = get_candidate parsed["choice"]
        vote.campaign = get_campaign parsed["campaign"]

        #to pass mass-assignment test
        parsed.delete "choice"
        parsed.delete "campaign"
        
        vote.assign_attributes parsed

        vote.save!
      end
    end
    file.close
  end

  # get candidate either from the current ivar, or from the database
  # or create a new one (in that order)
  def get_candidate name
    can = @candidates.select {|c| c.name == name}.first

    if can.present?
      return can
    else
      can = Candidate.find_by_name name

      if can.nil?
        can = Candidate.create :name => name
        
        can.save!
      end

      @candidates.push can

      return can
    end
  end

  # similar to get_candidate
  def get_campaign name
    cam = @campaigns.select {|c| c.name == name}.first

    if cam.present?
      return cam
    else
      cam = Campaign.find_by_name name

      if cam.nil?
        cam = Campaign.create :name => name
        cam.save!
      end

      @campaigns.push cam

      return cam
    end
  end

  def parse_line line
    split = line.split " "
    parsed = {}

    return nil if split.size != 9 or split[0] != "VOTE"

    parsed["message_timestamp"] = split[1]

    i=0
    split[2..-1].each do |sub|
      k_v = sub.split(":")

      #checking that the message format is correct
      if Vote::FIELDS_FORMAT[i] != k_v[0] or k_v[1].size < 1 
        return nil 
      end
      i += 1
      
      parsed[k_v[0].downcase] = k_v[1]
    end

    return parsed
  end
  
end
