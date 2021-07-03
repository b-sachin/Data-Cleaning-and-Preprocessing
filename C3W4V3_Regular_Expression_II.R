# "." is used to refer to any character

  mystr1<- c("its stupid the post 9-11 rules",
           "9-5 job may be good",
           "if any 1 of us did 9/11 we would have been caught in days.",
           "NetBios: scanning ip 203.169.114.66",
           "Front Door 9:11:46 AM",
           "Sings: 0118999881999119725...3 !")

  grep("9.11",mystr1,value = TRUE)

  grep("i.s",mystr1,value = TRUE)
  
  grep("i..s",mystr1,value = TRUE)

# "|" "or"

  mystr2<- c("is firewire like usb on none macs?",
           "the global flood makes sense within the context of the bible",
           "yeah ive had the fire on tonight",
           "... and the hurricanes", 
           "killer heatwaves, rednecks, gun nuts, etc.")
  
  grep("flood|fire",mystr2,value = TRUE)
  
  grep("flood|firewire|hurricanes",mystr2,value = TRUE)
  

  mystr3<-c("good to hear some good knews from someone here",
            "Good afternoon fellow american infidels!",
            "good on you-what do you drive?",
            "Katie... guess they had bad experiences...",
            "my middle name is trouble, Miss Bad News",
            "bad habbit",
            "bad coordination today",
            "Badcop, its because people want to use drugs")
  
  grep("^[Gg]ood|[Bb]ad",mystr3,value = TRUE)
  
  grep("^([Gg]ood|[Bb]ad)",mystr3,value = TRUE)
  
  mystr4<- c("i bet i can spell better than you and george bush combined",
             "BBC reported that President George W. Bush claimed God told him to invade I",
             "a bird in the hand is worth two george bushes")
  
  grep("[Gg]eorge( [Ww]\\.)? [Bb]ush",mystr4,value = TRUE)
  
  
  mystr5<- c("anyone wanna chat? 24, m, germany",
             "hello, 20.m here... ( east area + drives + webcam )",
             "(he means older men)",
             "( )")
  
  grep(".*",mystr5,value = TRUE)
  grep("\\(.\\)",mystr5,value = TRUE)
  grep("\\(.\\)*",mystr5,value = TRUE)
  
  
  mystr6<- c("42nd birgade",
             "so say 2 to 3 years",
             "its time 4 me 2 go 2 bed")
  
  grep("[0-9]+ (.*)[0-9]+",mystr6,value = TRUE)
  grep("[0-9]+(.*)[0-9]+",mystr6,value = TRUE)
  
  
  mystr7<- c("Bush is Bush",
             "in my view, Bush doesn't need these debates..",
             "bush doesn't need the debates? maybe you are right",
             "That's what Bush supporters are doing about the debate.",
             "Felix, I don't disagree that Bush was poorly prepared for the debate.",
             "indeed, but still, Bush should have taken the more serious debate.",
             "Keep repeating that Bush smirked and scowled during the debate")
  
  grep("[Bb]ush ([^ ]+ +){3,5}debate",mystr7,value = TRUE)
  grep("[Bb]ush ([^ ]+ +){3}debate",mystr7,value = TRUE)
  grep("[Bb]ush ([^ ]+ +){3,}debate",mystr7,value = TRUE)
  
  
  mystr8<- c("time for bed, night night twitter!",
             "blah blah blah blah",
             "my tattoo is so so itchy today",
             "i was standing outside. . .",
             "hi anybody at home hi")
  
  grep("([a-zA-Z]+) +\\0",mystr8,value = TRUE)
  
  
  mystr9<- c("sitting at starbucks",
             "setting up mysql and rails",
             "studying stuff for the exam",
             "stop fighting with cracker",
             "sore shoulders, stupid ergonomics")
  
  grep("^s(.*)s",mystr9,value = TRUE)
  
  grep("^s(.*?)s",mystr9,value = TRUE)